module Components.Timer exposing (timer)

-- ELM

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


-- INTERNALS

import Models exposing (Model)
import Msgs exposing (Msg(..))


timer : Model -> Html Msg
timer model =
    div [ class "timer" ]
        [ text <| (toString <| model.timer // 60) ++ ":" ++ (toString <| model.timer % 60)
        ]
