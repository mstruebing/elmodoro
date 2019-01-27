module Update exposing (update)

-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))
import Ports exposing (playSound)
import Utils exposing (timerToTimeString)


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
            if model.status == Running then
                if model.timer > 0 then
                    ( { model | timer = model.timer - 1 }, Cmd.none )
                    -- timer is not greater zero and should therefore always be zero (no negative time)

                else
                    ( { model | status = Finished }, playSound () )

            else
                ( model, Cmd.none )
