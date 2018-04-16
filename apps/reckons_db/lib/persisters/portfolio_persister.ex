defmodule ReckonsDB.PortfolioPersister do
  alias ReckonsDB.{Portfolio, Repo}

  @spec create(integer) :: {:ok, Portfolio.t()} | {:error, Ecto.Changeset.t()}
  @doc "creates a portfolio with the given portfolio id"
  def create(attrs) do
    %Portfolio{}
    |> validate_changeset(attrs)
    |> Repo.insert()
  end

  @spec update(Portfolio.t(), map) :: {:ok, Portfolio.t()} | {:error, Ecto.Changeset.t()}
  @doc "updates portfolio with the given params"
  def update(portfolio = %Portfolio{}, changes) do
    portfolio
    |> validate_changeset(changes)
    |> Repo.update()
  end

  @spec delete(integer) :: {:ok, Portfolio.t()} | {:error, Ecto.Changeset.t()}
  @doc "delete dat portfolio"
  def delete(id) do
    %Portfolio{id: id}
    |> Repo.delete()
  end

  defp validate_changeset(portfolio = %Portfolio{}, changes) do
    portfolio
    |> Ecto.Changeset.cast(changes, Map.keys(changes))
  end
end
