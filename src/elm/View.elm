module View exposing (view)

import Html exposing (Html, div, img, button, p, span, text)
import Html.Attributes exposing (src, class, style)
import Html.Events exposing (onClick)


-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ div [ class "timer" ]
            [ text <| (toString <| model.timer // 60) ++ ":" ++ (toString <| model.timer % 60)
            ]
        , div [ class "controls" ]
            [ (if model.status == Paused then
                button [ onClick Resume ] [ text "RESUME" ]
               else if model.status == Running then
                button [ onClick Pause ] [ text "PAUSE" ]
               else
                -- 25 minutes * 60 seconds
                button [ onClick <| Start <| 25 * 60 ] [ text "START" ]
              )
            , button [ onClick Stop ] [ text "STOP" ]

            -- 5 minutes * 60 seconds
            , button [ onClick <| Start <| 5 * 60 ] [ text "SHORT BREAK" ]

            -- 15 minutes * 60 seconds
            , button [ onClick <| Start <| 15 * 60 ] [ text "LONG BREAK" ]
            ]
        ]
