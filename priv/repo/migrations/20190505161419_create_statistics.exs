defmodule Pomodoro.Repo.Migrations.CreateStatistics do
  use Ecto.Migration

  def change do
    create table(:statistics) do
      add :pomodoros, :integer, default: 0
      add :short_breaks, :integer, default: 0
      add :long_breaks, :integer, default: 0

      timestamps()
    end

  end
end
