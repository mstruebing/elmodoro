module Msgs exposing (Msg(..))

import Time exposing (Posix)


type Msg
    = Start Int
    | Pause
    | Resume
    | Stop
    | ReduceSeconds Posix
    | TimerTick Int
    | VisibilityTick Int
