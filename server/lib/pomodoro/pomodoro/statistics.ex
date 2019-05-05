defmodule Pomodoro.Pomodoro.Statistics do
  use Ecto.Schema
  import Ecto.Changeset


  schema "statistics" do
    field :long_breaks, :integer
    field :pomodoros, :integer
    field :short_breaks, :integer

    timestamps()
  end

  @doc false
  def changeset(statistics, attrs) do
    statistics
    |> cast(attrs, [:pomodoros, :short_breaks, :long_breaks])
    |> validate_required([:pomodoros, :short_breaks, :long_breaks])
  end
end
