defmodule Pomodoro.Pomodoro do
  @moduledoc """
  The Pomodoro context.
  """

  import Ecto.Query, warn: false
  alias Pomodoro.Repo

  alias Pomodoro.Pomodoro.Statistics

  @doc """
  Returns the list of statistics.

  ## Examples

      iex> list_statistics()
      [%Statistics{}, ...]

  """
  def list_statistics do
    Repo.all(Statistics)
  end

  @doc """
  Gets a single statistics.

  Raises `Ecto.NoResultsError` if the Statistics does not exist.

  ## Examples

      iex> get_statistics!(123)
      %Statistics{}

      iex> get_statistics!(456)
      ** (Ecto.NoResultsError)

  """
  def get_statistics!(id), do: Repo.get!(Statistics, id)

  @doc """
  Creates a statistics.

  ## Examples

      iex> create_statistics(%{field: value})
      {:ok, %Statistics{}}

      iex> create_statistics(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_statistics(attrs \\ %{}) do
    %Statistics{}
    |> Statistics.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a statistics.

  ## Examples

      iex> update_statistics(statistics, %{field: new_value})
      {:ok, %Statistics{}}

      iex> update_statistics(statistics, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_statistics(%Statistics{} = statistics, attrs) do
    statistics
    |> Statistics.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Statistics.

  ## Examples

      iex> delete_statistics(statistics)
      {:ok, %Statistics{}}

      iex> delete_statistics(statistics)
      {:error, %Ecto.Changeset{}}

  """
  def delete_statistics(%Statistics{} = statistics) do
    Repo.delete(statistics)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking statistics changes.

  ## Examples

      iex> change_statistics(statistics)
      %Ecto.Changeset{source: %Statistics{}}

  """
  def change_statistics(%Statistics{} = statistics) do
    Statistics.changeset(statistics, %{})
  end
end
