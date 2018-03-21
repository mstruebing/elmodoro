module Components.Timer exposing (timer)

-- ELM

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import String exposing (padLeft)


-- INTERNALS

import Models exposing (Model)
import Msgs exposing (Msg(..))


timer : Model -> Html Msg
timer model =
    div [ class "timer" ]
        [ text <| getMinutes model ++ ":" ++ getSeconds model
        ]


getMinutes : Model -> String
getMinutes model =
    (model.timer // 60)
        |> toString
        |> padLeft 2 '0'


getSeconds : Model -> String
getSeconds model =
    (model.timer % 60)
        |> toString
        |> padLeft 2 '0'
