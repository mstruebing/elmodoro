module Components.Timer exposing (timer)

-- ELM

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


-- INTERNALS

import Models exposing (Model)
import Msgs exposing (Msg(..))
import Utils exposing (timerToTimeString)


timer : Model -> Html Msg
timer model =
    div [ class "timer" ]
        [ text <| timerToTimeString model.timer
        ]
