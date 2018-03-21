module Components.Buttons
    exposing
        ( startButton
        , pauseButton
        , resumeButton
        , stopButton
        , breakButton
        )

-- ELM

import Html exposing (Html, button, text)
import Html.Events exposing (onClick)


-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


startButton : Model -> Msg -> Html Msg
startButton model msg =
    if model.status == Stopped then
        button [ onClick msg ] [ text "START" ]
    else
        text ""


pauseButton : Model -> Msg -> Html Msg
pauseButton model msg =
    if model.status == Running then
        button [ onClick msg ] [ text "PAUSE" ]
    else
        text ""


resumeButton : Model -> Msg -> Html Msg
resumeButton model msg =
    if model.status == Paused then
        button [ onClick msg ] [ text "RESUME" ]
    else
        text ""


stopButton : Model -> Msg -> Html Msg
stopButton model msg =
    if model.status /= Stopped then
        button [ onClick msg ] [ text "STOP" ]
    else
        text ""


breakButton : Model -> Msg -> String -> Html Msg
breakButton model msg caption =
    if model.status == Stopped then
        button [ onClick msg ] [ text caption ]
    else
        text ""
