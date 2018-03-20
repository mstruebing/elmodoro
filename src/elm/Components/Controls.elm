module Components.Controls exposing (controls)

-- ELM

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


controls : Model -> Html Msg
controls model =
    div [ class "controls" ]
        [ (if model.status == Paused then
            button [ onClick Resume ] [ text "RESUME" ]
           else if model.status == Running then
            button [ onClick Pause ] [ text "PAUSE" ]
           else
            -- 25 minutes * 60 seconds
            button [ onClick <| Start <| 25 * 60 ] [ text "START POMODORO" ]
          )
        , (if model.status /= Stopped then
            button [ onClick Stop ] [ text "STOP" ]
           else
            text ""
          )

        -- 5 minutes * 60 seconds
        , (if model.status /= Running then
            button [ onClick <| Start <| 5 * 60 ] [ text "SHORT BREAK" ]
           else
            text ""
          )

        -- 15 minutes * 60 seconds
        , (if model.status /= Running then
            button [ onClick <| Start <| 15 * 60 ] [ text "SHORT BREAK" ]
           else
            text ""
          )
        ]
