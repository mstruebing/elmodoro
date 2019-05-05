# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pomodoro,
  ecto_repos: [Pomodoro.Repo]

# Configures the endpoint
config :pomodoro, PomodoroWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DDEtAufvgWVjzwaWJdi5j81pLUM3UUA0xrOCBzX3SeFYT6Y5yjHH04PHf2llfxHb",
  render_errors: [view: PomodoroWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pomodoro.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
