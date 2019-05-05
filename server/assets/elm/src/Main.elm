module App exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div [ class "m-auto max-w-sm w-full p-4" ]
        [ input [ type_ "text", class "appearance-none shadow-md hover:border-green border mb-4 p-2 w-full", placeholder "What do you want to do?" ] []
        , ul [ class "list-reset shadow-md text-lg" ]
            [ li [ class "todo" ]
                [ text "Mow the lawn"
                , span [] [ text "x" ]
                ]
            , li [ class "todo" ]
                [ text "Mow the lawn"
                , span [] [ text "x" ]
                ]
            , li [ class "todo" ]
                [ text "Mow the lawn"
                , span [] [ text "x" ]
                ]
            ]
        ]
