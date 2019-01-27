module Utils exposing (timerToTimeString)

import String exposing (padLeft)


timerToTimeString : Int -> String
timerToTimeString time =
    getMinutes time ++ ":" ++ getSeconds time


getMinutes : Int -> String
getMinutes timer =
    (timer // 60)
        |> String.fromInt
        |> padLeft 2 '0'


getSeconds : Int -> String
getSeconds timer =
    modBy 60 timer
        |> String.fromInt
        |> padLeft 2 '0'
