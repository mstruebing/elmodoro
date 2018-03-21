module Msgs exposing (Msg(..))

import Time exposing (Time)


type Msg
    = Start Int
    | Pause
    | Resume
    | Stop
    | ReduceSeconds Time
