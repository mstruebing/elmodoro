module Components.Buttons
    exposing
        ( startButton
        , pauseButton
        , resumeButton
        , stopButton
        )

-- ELM

import Html exposing (Html, text)
import Html.Events exposing (onClick)


-- INTERNALS

import Models exposing (Status(..))
import Msgs exposing (Msg(..))


startButton : Status -> Int -> String -> Html Msg
startButton status minutes caption =
    button (status == Stopped) (Start <| minutes * 60) caption


pauseButton : Status -> Html Msg
pauseButton status =
    button (status == Running) Pause "PAUSE"


resumeButton : Status -> Html Msg
resumeButton status =
    button (status == Paused) Resume "RESUME"


stopButton : Status -> Html Msg
stopButton status =
    button (status /= Stopped) Stop "STOP"


button : Bool -> Msg -> String -> Html Msg
button active msg caption =
    if active then
        Html.button [ onClick msg ] [ text caption ]
    else
        text ""
