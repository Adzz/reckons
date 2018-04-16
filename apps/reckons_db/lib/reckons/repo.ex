defmodule ReckonsDB.Repo do
  use Ecto.Repo, otp_app: :reckons_db

  @doc """
  Finds a record by ID in the given schema.

  ## Examples

      iex> ReckonsDB.get_record_by_id(ReckonsDB.Property, 1)
      %ReckonsDB.Property{id: 1}

  """
  @spec get_record_by_id(atom(), integer()) :: {:error, binary()} | {:ok, map()}
  def get_record_by_id(schema, id) do
    case ReckonsDB.Repo.get(schema, id) do
      nil -> {:error, "#{schema} with id #{id} not found"}
      record -> {:ok, record}
    end
  end
end
