defmodule ReckonsAPI.PropertyResolver do
  alias ReckonsDB.{Repo, PropertyPersister, Property}

  @doc """
  Get a property by ID. Returns {:error message} if property not found
  """
  def find(%{id: id}, _context) do
    with {:ok, property} <- Repo.get_record_by_id(Property, id) do
      {:ok, property}
    end
  end

  @doc """
  Creates a property with the given portfolio id
  """
  def create(%{input: %{portfolio_id: portfolio_id}}, _context) do
    portfolio_id
    |> String.to_integer()
    |> PropertyPersister.create()
  end

  @doc """
  Updates a property. Returns {:error, message} if no property found
  """
  def update(%{id: id, input: attrs}, _context) do
    with {:ok, property} <- Repo.get_record_by_id(Property, id) do
      PropertyPersister.update(property, attrs)
    end
  end

  def delete(%{id: id}, _context) do
    PropertyPersister.delete(String.to_integer(id))
  end
end
