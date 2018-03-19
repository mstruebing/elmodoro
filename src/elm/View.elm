module View exposing (view)

import Html exposing (Html, div, img, button, p, span, text)
import Html.Attributes exposing (src, class, style)
import Html.Events exposing (onClick)


-- INTERNALS

import Models exposing (Model)
import Msgs exposing (Msg(..))


-- COMPONENTS

import Components.Hello exposing (hello)


view : Model -> Html Msg
view model =
    div [ class "container", style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ -- inline CSS (literal)
          div [ class "row" ]
            [ div [ class "col-xs-12" ]
                [ div [ class "jumbotron" ]
                    [ img [ src "static/img/elm.jpg", style styles.img ] [] -- inline CSS (via var)
                    , hello model -- ext 'hello' component (takes 'model' as arg)
                    , p [] [ text ("Elm Webpack Starter") ]
                    , button [ class "btn btn-primary btn-lg", onClick Increment ]
                        [ -- click handler
                          span [ class "glyphicon glyphicon-star" ] [] -- glyphicon
                        , span [] [ text "FTW!" ]
                        ]
                    ]
                ]
            ]
        ]


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
