module Models exposing (..)

import Time


type alias Model =
    { status : Status
    , timer : Int
    , lastTick : Maybe Time.Posix
    , pomodoroMinutes : Int
    , shortBreakMinutes : Int
    , longBreakMinutes : Int
    , settingsOpen : Bool
    }


type Status
    = Running
    | Finished
    | Paused
    | Stopped
