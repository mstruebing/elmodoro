module View exposing (view)

-- ELM
-- INTERNALS
-- COMPONENTS

import Browser exposing (Document)
import Components.Controls exposing (controls)
import Components.Timer exposing (timer)
import Html exposing (Html, button, div, img, p, span, text)
import Html.Attributes exposing (class)
import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))


view : Model -> Document Msg
view model =
    { title = "Elm Scroll Position Demo"
    , body =
        [ div [ class "centered" ]
            [ timer model
            , controls model
            ]
        ]
    }
