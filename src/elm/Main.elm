module Main exposing (..)

import Html exposing (..)


-- INTERNALS

import Msgs exposing (Msg(..))
import Update exposing (update)
import Models exposing (initialModel, Model)
import View exposing (view)


-- APP


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, view = view, update = update }



-- CSS STYLES
