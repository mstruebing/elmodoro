module View exposing (view)

-- ELM

import Html exposing (Html, div, img, button, p, span, text)


-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


-- COMPONENTS

import Components.Timer exposing (timer)
import Components.Controls exposing (controls)


view : Model -> Html Msg
view model =
    div []
        [ timer model
        , controls model
        ]
