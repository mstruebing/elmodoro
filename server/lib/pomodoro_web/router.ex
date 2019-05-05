defmodule PomodoroWeb.Router do
  use PomodoroWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PomodoroWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
  end


  if Mix.env() == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PomodoroWeb.Schema,
      interface: :playground,
      context: %{pubsub: PomodoroWeb.Endpoint}
  end
end
