module Models exposing (..)

import Time


initialModel : Model
initialModel =
    { status = Stopped
    , timer = 0
    , lastTick = Nothing
    }


type alias Model =
    { status : Status
    , timer : Int
    , lastTick : Maybe Time.Posix
    }


type Status
    = Running
    | Finished
    | Paused
    | Stopped
