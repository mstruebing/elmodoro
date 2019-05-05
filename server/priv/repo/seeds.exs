# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pomodoro.Repo.insert!(%Pomodoro.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pomodoro.Pomodoro.Statistics
alias Pomodoro.Repo

%Statistics{pomodoros: 1, short_breaks: 1, long_breaks: 1} |> Repo.insert!
