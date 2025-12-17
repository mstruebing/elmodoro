port module Ports exposing (playSound, setTimerActive, timerTick, visibilityTick)


port playSound : () -> Cmd msg


port setTimerActive : Bool -> Cmd msg


port timerTick : (Int -> msg) -> Sub msg


port visibilityTick : (Int -> msg) -> Sub msg
