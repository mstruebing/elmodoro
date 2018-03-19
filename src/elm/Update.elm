module Update exposing (update)

-- INTERNALS

import Msgs exposing (Msg(..))
import Models exposing (Model)


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        Increment ->
            { model | timer = model.timer + 1 }
