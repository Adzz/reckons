defmodule ReckonsDB.PropertyPersister do
  alias ReckonsDB.{Property, Repo}

  @spec create(integer) :: {:ok, Property.t()} | {:error, Ecto.Changeset.t()}
  @doc "creates a property with the given portfolio id"
  def create(portfolio_id) do
    %Property{}
    |> validate_changeset(%{portfolio_id: portfolio_id})
    |> Repo.insert()
  end

  @spec update(Property.t(), map) :: {:ok, Property.t()} | {:error, Ecto.Changeset.t()}
  @doc "updates property with the given params"
  def update(property = %Property{}, changes) do
    property
    |> validate_changeset(changes)
    |> Repo.update()
  end

  @spec delete(integer) :: {:ok, Property.t()} | {:error, Ecto.Changeset.t()}
  @doc "delete dat property"
  def delete(id) do
    %Property{id: id}
    |> Repo.delete()
  end

  defp validate_changeset(property = %Property{}, changes) do
    property
    |> Ecto.Changeset.cast(changes, Map.keys(changes))
  end
end
