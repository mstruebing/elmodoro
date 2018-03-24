module Subscriptions exposing (subscriptions)

-- ELM

import Time exposing (Time, second)


-- INTERNALS

import Models exposing (Model)
import Msgs exposing (Msg(..))
import Models exposing (Status(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.status == Running then
        Sub.batch
            [ Time.every second ReduceSeconds ]
    else
        Sub.none
