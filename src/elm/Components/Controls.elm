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
        , breakButton
        )


controls : Model -> Html Msg
controls model =
    div [ class "controls" ]
        [ startButton model (Start <| 25 * 60)
        , pauseButton model Pause
        , resumeButton model Resume
        , stopButton model Stop
        , breakButton model (Start <| 5 * 60) "SHORT BREAK"
        , breakButton model (Start <| 15 * 60) "LONG BREAK"
        ]
