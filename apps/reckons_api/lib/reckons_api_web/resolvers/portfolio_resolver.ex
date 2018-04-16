defmodule ReckonsAPI.PortfolioResolver do
  alias ReckonsDB.{Repo, PortfolioPersister, Portfolio}

  @doc """
  Get a portfolio by ID. Returns {:error message} if portfolio not found
  """
  def find(%{id: id}, _context) do
    with {:ok, portfolio} <- Repo.get_record_by_id(Portfolio, id) do
      {:ok, portfolio}
    end
  end

  @doc """
  Creates a portfolio with the given portfolio id
  """
  def create(%{input: attrs}, _context) do
    PortfolioPersister.create(attrs)
  end

  @doc """
  Updates a portfolio. Returns {:error, message} if no portfolio found
  """
  def update(%{id: id, input: attrs}, _context) do
    with {:ok, portfolio} <- Repo.get_record_by_id(Portfolio, id) do
      PortfolioPersister.update(portfolio, attrs)
    end
  end

  def delete(%{id: id}, _context) do
    PortfolioPersister.delete(String.to_integer(id))
  end
end
