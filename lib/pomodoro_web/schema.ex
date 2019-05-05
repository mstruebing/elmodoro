defmodule PomodoroWeb.Schema do
  use Absinthe.Schema

  alias PomodoroWeb.StatisticsResolver

  object :statistics do
    field :pomodoros, non_null(:integer)
    field :short_breaks, non_null(:integer)
    field :long_breaks, non_null(:integer)
  end

  query do
    field :statistics, non_null(:statistics) do
      resolve &StatisticsResolver.statistics/3
    end
  end

  mutation do
    field :add_pomodoro, non_null(:statistics) do
      resolve &StatisticsResolver.add_pomodoro/3
    end

    field :add_short_break, non_null(:statistics) do
      resolve &StatisticsResolver.add_short_break/3
    end

    field :add_long_break, non_null(:statistics) do
      resolve &StatisticsResolver.add_long_break/3
    end
  end
end
