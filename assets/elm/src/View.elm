module View exposing (view)

-- ELM
-- INTERNALS
-- COMPONENTS

import Browser exposing (Document)
import Components.Controls exposing (controls)
import Components.Github as Github
import Components.Timer exposing (timer)
import Html exposing (Html, button, div, img, p, span, text)
import Html.Attributes exposing (class, id)
import Models exposing (Model, Status(..))
import Msgs exposing (Msg(..))
import Utils exposing (timerToTimeString)


view : Model -> Document Msg
view model =
    -- if running seconds // finished
    { title = getTitle model
    , body =
        [ Github.view
        , div
            [ id "root" ]
            [ div [ class "centered" ]
                [ timer model
                , controls model
                ]
            ]
        ]
    }


getTitle : Model -> String
getTitle model =
    case model.status of
        Running ->
            timerToTimeString model.timer

        Paused ->
            "Pause"

        Finished ->
            "Finished"

        _ ->
            "Elmodoro"
