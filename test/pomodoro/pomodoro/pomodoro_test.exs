defmodule Pomodoro.PomodoroTest do
  use Pomodoro.DataCase

  alias Pomodoro.Pomodoro

  describe "statistics" do
    alias Pomodoro.Pomodoro.Statistics

    @valid_attrs %{long_breaks: 42, pomodoros: 42, short_breaks: 42}
    @update_attrs %{long_breaks: 43, pomodoros: 43, short_breaks: 43}
    @invalid_attrs %{long_breaks: nil, pomodoros: nil, short_breaks: nil}

    def statistics_fixture(attrs \\ %{}) do
      {:ok, statistics} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pomodoro.create_statistics()

      statistics
    end

    test "list_statistics/0 returns all statistics" do
      statistics = statistics_fixture()
      assert Pomodoro.list_statistics() == [statistics]
    end

    test "get_statistics!/1 returns the statistics with given id" do
      statistics = statistics_fixture()
      assert Pomodoro.get_statistics!(statistics.id) == statistics
    end

    test "create_statistics/1 with valid data creates a statistics" do
      assert {:ok, %Statistics{} = statistics} = Pomodoro.create_statistics(@valid_attrs)
      assert statistics.long_breaks == 42
      assert statistics.pomodoros == 42
      assert statistics.short_breaks == 42
    end

    test "create_statistics/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pomodoro.create_statistics(@invalid_attrs)
    end

    test "update_statistics/2 with valid data updates the statistics" do
      statistics = statistics_fixture()
      assert {:ok, statistics} = Pomodoro.update_statistics(statistics, @update_attrs)
      assert %Statistics{} = statistics
      assert statistics.long_breaks == 43
      assert statistics.pomodoros == 43
      assert statistics.short_breaks == 43
    end

    test "update_statistics/2 with invalid data returns error changeset" do
      statistics = statistics_fixture()
      assert {:error, %Ecto.Changeset{}} = Pomodoro.update_statistics(statistics, @invalid_attrs)
      assert statistics == Pomodoro.get_statistics!(statistics.id)
    end

    test "delete_statistics/1 deletes the statistics" do
      statistics = statistics_fixture()
      assert {:ok, %Statistics{}} = Pomodoro.delete_statistics(statistics)
      assert_raise Ecto.NoResultsError, fn -> Pomodoro.get_statistics!(statistics.id) end
    end

    test "change_statistics/1 returns a statistics changeset" do
      statistics = statistics_fixture()
      assert %Ecto.Changeset{} = Pomodoro.change_statistics(statistics)
    end
  end
end
