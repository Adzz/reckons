defmodule ReckonsAPI.PropertyResolver do
  alias ReckonsDB.Repo
  alias ReckonsDB.Property

  @doc """
  Get a property by ID, or by address if using the Data API for property lookup.
  """
  def find(%{id: id}, _ctx) do
    case Repo.get(Property, id) do
      nil -> {:error, "Property id #{id} not found"}
      property -> {:ok, property}
    end
  end
end
