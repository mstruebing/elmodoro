module Update exposing (update)

-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))
import Ports exposing (playSound)
import Task
import Time exposing (Posix, now, posixToMillis)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Start time ->
            ( { model | timer = time, status = Running, lastTick = Nothing }
            , Task.perform ReduceSeconds now
            )

        Pause ->
            ( { model | status = Paused, lastTick = Nothing }, Cmd.none )

        Resume ->
            ( { model | status = Running, lastTick = Nothing }
            , Task.perform ReduceSeconds now
            )

        Stop ->
            ( { model | status = Stopped, timer = 0, lastTick = Nothing }, Cmd.none )

        ReduceSeconds now ->
            if model.status == Running then
                case model.lastTick of
                    Nothing ->
                        -- First tick after start/resume anchors the clock without subtracting time
                        ( { model | lastTick = Just now }, Cmd.none )

                    Just last ->
                        let
                            elapsedMs =
                                posixToMillis now - posixToMillis last

                            elapsedSeconds =
                                floor (toFloat elapsedMs / 1000)

                            remaining =
                                model.timer - elapsedSeconds
                        in
                        if elapsedSeconds <= 0 then
                            ( { model | lastTick = Just now }, Cmd.none )

                        else if remaining > 0 then
                            ( { model | timer = remaining, lastTick = Just now }, Cmd.none )

                        else
                            ( { model | status = Finished, timer = 0, lastTick = Nothing }, playSound () )

            else
                ( model, Cmd.none )
