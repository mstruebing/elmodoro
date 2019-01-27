module Subscriptions exposing (subscriptions)

-- ELM
-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))
import Time exposing (every)


second : Float
second =
    1000


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.status == Running then
        Sub.batch
            [ every second ReduceSeconds ]

    else
        Sub.none
