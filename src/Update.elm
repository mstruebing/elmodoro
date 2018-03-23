module Update exposing (update)

-- INTERNALS

import Msgs exposing (Msg(..))
import Models exposing (Model, Status(..))
import Ports exposing (setTitle, playSound)
import Utils exposing (timerToTimeString)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Start time ->
            ( { model | timer = time, status = Running }, Cmd.none )

        Pause ->
            ( { model | status = Paused }, setTitle "PAUSED" )

        Resume ->
            ( { model | status = Running }, setTitle <| timerToTimeString <| model.timer )

        Stop ->
            ( { model | status = Stopped, timer = 0 }, setTitle "Elmodoro" )

        ReduceSeconds _ ->
            if model.status == Running then
                if model.timer > 0 then
                    ( { model | timer = model.timer - 1 }, setTitle <| timerToTimeString <| model.timer - 1 )
                    -- timer is not greater zero and should therefore always be zero (no negative time)
                else
                    ( { model | status = Finished }, Cmd.batch [ setTitle "FINISHED", playSound () ] )
            else
                ( model, Cmd.none )
