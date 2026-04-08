module Main exposing (main)

import Browser
import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)



-- FLAGS


type alias Flags =
    { pomodoroMinutes : Int
    , shortBreakMinutes : Int
    , longBreakMinutes : Int
    }



-- APP


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { status = Stopped
      , timer = 0
      , lastTick = Nothing
      , pomodoroMinutes = flags.pomodoroMinutes
      , shortBreakMinutes = flags.shortBreakMinutes
      , longBreakMinutes = flags.longBreakMinutes
      , settingsOpen = False
      }
    , Cmd.none
    )


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
