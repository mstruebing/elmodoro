port module Ports exposing (setTitle, playSound)


port setTitle : String -> Cmd msg


port playSound : () -> Cmd msg
