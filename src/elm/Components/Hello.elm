module Components.Hello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String
import Models exposing (Model)


-- hello component


hello : Model -> Html a
hello model =
    div
        [ class "h1" ]
        [ text ("Hello, Elm" ++ ("!" |> String.repeat model.timer)) ]
