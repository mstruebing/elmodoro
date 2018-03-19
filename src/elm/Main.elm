module Main exposing (..)

import Html exposing (program)


-- INTERNALS

import Msgs exposing (Msg(..))
import Update exposing (update)
import Models exposing (initialModel, Model)
import View exposing (view)
import Subscriptions exposing (subscriptions)


-- APP


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
