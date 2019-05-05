defmodule PomodoroWeb.StatisticsResolver do
  alias Pomodoro.Pomodoro

  defp get_statistics() do
    Enum.at(Pomodoro.list_statistics(), 0)
  end

  def statistics(_root, _args, _info) do
    {:ok, get_statistics()}
  end

  def add_pomodoro(_root, _args, _info) do
    statistics = get_statistics()
    Pomodoro.update_statistics(statistics, %{pomodoros: statistics.pomodoros + 1})
  end

  def add_short_break(_root, _args, _info) do
    statistics = get_statistics()
    Pomodoro.update_statistics(statistics, %{short_breaks: statistics.short_breaks + 1})
  end

  def add_long_break(_root, _args, _info) do
    statistics = get_statistics()
    Pomodoro.update_statistics(statistics, %{long_breaks: statistics.long_breaks + 1})
  end
end
