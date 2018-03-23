# elmodoro [![Build Status](https://travis-ci.org/mstruebing/elmodoro.svg?branch=master)](https://travis-ci.org/mstruebing/elmodoro)

A pomodoro application written in elm
You can find the code in action on [pomodoro.maex.me](http://pomodoro.maex.me)

## Next steps:
- [ ] make timer length's configurable
- [ ] store adjusted timer length's into localstorage
- [ ] save statistics into local storage
- [ ] display statistics

## Local environment

### Requirements
You need node in version 9.8.0 installed.
You need [create-elm-app](https://github.com/halfzebra/create-elm-app) installed.
You need [GNU Make](https://www.gnu.org/software/make/) installed.

There are three important development commands:

`make build`: installs all needed elm dependencies and builds the application.
`make start`: installs all needed elm dependencies and runs the development server.
`make test`: installs all needed elm dependencies and runs the tests.
