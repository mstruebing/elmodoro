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
import Html exposing (Html, button, div, input, label, span, text)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onClick, onInput)
import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


controls : Model -> Html Msg
controls model =
    div [ class "controls-wrapper" ]
        [ div [ class "controls" ]
            [ startButton model.status model.pomodoroMinutes "START"
            , pauseButton model.status
            , resumeButton model.status
            , stopButton model.status
            , startButton model.status model.shortBreakMinutes "SHORT BREAK"
            , startButton model.status model.longBreakMinutes "LONG BREAK"
            , button [ onClick ToggleSettings ] [ text "SETTINGS" ]
            ]
        , if model.settingsOpen then
            settingsPanel model

          else
            text ""
        ]


settingsPanel : Model -> Html Msg
settingsPanel model =
    div [ class "settings-panel" ]
        [ settingRow "Focus" model.pomodoroMinutes SetPomodoroMinutes
        , settingRow "Short Break" model.shortBreakMinutes SetShortBreakMinutes
        , settingRow "Long Break" model.longBreakMinutes SetLongBreakMinutes
        ]


settingRow : String -> Int -> (Int -> Msg) -> Html Msg
settingRow labelText currentMinutes toMsg =
    div [ class "setting-row" ]
        [ label [] [ text labelText ]
        , input
            [ type_ "number"
            , Html.Attributes.min "1"
            , Html.Attributes.step "1"
            , value (String.fromInt currentMinutes)
            , onInput
                (\str ->
                    case String.toInt str of
                        Just n ->
                            if n >= 1 then
                                toMsg n

                            else
                                toMsg 1

                        Nothing ->
                            toMsg currentMinutes
                )
            ]
            []
        , span [ class "unit" ] [ text "min" ]
        ]
