module Components.Controls exposing (controls)

-- ELM
-- INTERNALS
-- COMPONENTS

import Components.Buttons
    exposing
        ( pauseButton
        , resumeButton
        , startButton
        , stopButton
        )
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


controls : Model -> Html Msg
controls model =
    div [ class "controls" ]
        [ startButton model.status 25 "START"
        , pauseButton model.status
        , resumeButton model.status
        , stopButton model.status
        , startButton model.status 5 "SHORT BREAK"
        , startButton model.status 15 "LONG BREAK"
        ]
