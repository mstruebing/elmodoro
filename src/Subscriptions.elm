module Subscriptions exposing (subscriptions)

-- ELM
-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))
import Ports exposing (timerTick, visibilityTick)


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.status == Running then
        Sub.batch
            [ timerTick TimerTick
            , visibilityTick VisibilityTick
            ]

    else
        Sub.none
