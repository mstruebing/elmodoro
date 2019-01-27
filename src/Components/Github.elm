module Components.Github exposing (view)

import Html exposing (Html, a, div, img)
import Html.Attributes exposing (class, href, src, target)


view : Html msg
view =
    div [ class "github" ]
        [ a
            [ href "https://github.com/mstruebing/elmodoro"
            , target "blank"
            ]
            [ img [ src "/github.svg" ] []
            ]
        ]
