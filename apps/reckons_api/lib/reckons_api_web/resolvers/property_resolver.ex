defmodule ReckonsAPI.PropertyResolver do
  alias ReckonsDB.{Repo, Property}

  @doc """
  Get a property by ID. Returns {:error message} if property not found
  """
  def find(%{id: id}, _context) do
    with {:ok, property} <- get_property(id) do
      {:ok, property}
    end
  end

  @doc """
  Creates a property with the given portfolio id
  """
  def create(%{input: %{portfolio_id: portfolio_id}}, _context) do
    portfolio_id
    |> String.to_integer()
    |> ReckonsAPI.PropertyPersister.create()
  end

  @doc """
  Updates a property. Returns {:error, message} if no property found
  """
  def update(%{id: id, input: attrs}, _context) do
    with {:ok, property} <- get_property(id) do
      ReckonsAPI.PropertyPersister.update(property, attrs)
    end
  end

  def delete(%{id: id}, _context) do
    ReckonsAPI.PropertyPersister.delete(String.to_integer(id))
  end

  defp get_property(property_id) do
    case Repo.get(Property, property_id) do
      nil ->
        {:error, "Property id #{property_id} not found"}

      property ->
        {:ok, property}
    end
  end
end
