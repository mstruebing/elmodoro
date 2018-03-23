module Components.Controls exposing (controls)

-- ELM

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)


-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


-- COMPONENTS

import Components.Buttons
    exposing
        ( startButton
        , pauseButton
        , resumeButton
        , stopButton
        )


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
