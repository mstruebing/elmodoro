module View exposing (view)

-- ELM

import Html exposing (Html, div, img, button, p, span, text)
import Html.Attributes exposing (class)


-- INTERNALS

import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


-- COMPONENTS

import Components.Timer exposing (timer)
import Components.Controls exposing (controls)


view : Model -> Html Msg
view model =
    div [ class "centered" ]
        [ timer model
        , controls model
        ]
