module Tests exposing (..)

import Test exposing (..)
import Expect
import Utils exposing (timerToTimeString)


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Utils"
        [ test "timerToTimeString 5 minute" <|
            \_ ->
                Expect.equal "05:00" (timerToTimeString <| 5 * 60)
        , test "timerToTimeString 20 seconds" <|
            \_ ->
                Expect.equal "00:20" (timerToTimeString 20)
        , test "timerToTimeString 1 minute and 20 seconds" <|
            \_ ->
                Expect.equal "01:20" (timerToTimeString <| 1 * 60 + 20)
        , test "timerToTimeString 12 minutes" <|
            \_ ->
                Expect.equal "12:00" (timerToTimeString <| 12 * 60)
        , test "timerToTimeString 5 seconds" <|
            \_ ->
                Expect.equal "00:05" (timerToTimeString 5)
        , test "timerToTimeString 25 seconds" <|
            \_ ->
                Expect.equal "00:25" (timerToTimeString 25)
        ]
