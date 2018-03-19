module Update exposing (update)

-- INTERNALS

import Msgs exposing (Msg(..))
import Models exposing (Model, Status(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Start time ->
            ( { model | timer = time, status = Running }, Cmd.none )

        Pause ->
            ( { model | status = Paused }, Cmd.none )

        Resume ->
            ( { model | status = Running }, Cmd.none )

        Stop ->
            ( { model | status = Stopped, timer = 0 }, Cmd.none )

        ReduceSeconds _ ->
            if model.status == Running && model.timer > 0 then
                ( { model | timer = model.timer - 1 }, Cmd.none )
            else if model.status == Running && model.timer == 0 then
                -- TODO: Trigger sound and Message to stop
                ( { model | status = Finished }, Cmd.none )
            else
                ( model, Cmd.none )
