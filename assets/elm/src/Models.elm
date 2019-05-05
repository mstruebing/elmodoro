module Models exposing (..)


initialModel : Model
initialModel =
    { status = Stopped
    , timer = 0
    }


type alias Model =
    { status : Status
    , timer : Int
    }


type Status
    = Running
    | Finished
    | Paused
    | Stopped
