module Update exposing (update)

-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))
import Ports exposing (playSound, setTimerActive)
import Task
import Time exposing (Posix, millisToPosix, now, posixToMillis)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Start time ->
            ( { model | timer = time, status = Running, lastTick = Nothing }
            , Cmd.batch [ Task.perform ReduceSeconds now, setTimerActive True ]
            )

        Pause ->
            ( { model | status = Paused, lastTick = Nothing }, setTimerActive False )

        Resume ->
            ( { model | status = Running, lastTick = Nothing }
            , Cmd.batch [ Task.perform ReduceSeconds now, setTimerActive True ]
            )

        Stop ->
            ( { model | status = Stopped, timer = 0, lastTick = Nothing }, setTimerActive False )

        TimerTick millis ->
            update (ReduceSeconds (millisToPosix millis)) model

        VisibilityTick millis ->
            update (ReduceSeconds (millisToPosix millis)) model

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
                            ( { model | status = Finished, timer = 0, lastTick = Nothing }
                            , Cmd.batch [ playSound (), setTimerActive False ]
                            )

            else
                ( model, Cmd.none )
