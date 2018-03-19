module Subscriptions exposing (subscriptions)

import Models exposing (Model)
import Msgs exposing (Msg(..))
import Time exposing (Time, minute, second)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every second ReduceSeconds ]
