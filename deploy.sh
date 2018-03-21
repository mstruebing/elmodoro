#!/usr/bin/env bash

set -e

rm -Rf ./build
elm-app build
rsync -ravz ./build/* maexBox:/home/maex/projects/pomodoro.maex.me/
