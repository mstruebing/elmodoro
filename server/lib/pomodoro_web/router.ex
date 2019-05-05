defmodule PomodoroWeb.Router do
  use PomodoroWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api 

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PomodoroWeb.Schema,
      interface: :playground,
      context: %{pubsub: PomodoroWeb.Endpoint}
  end
end
