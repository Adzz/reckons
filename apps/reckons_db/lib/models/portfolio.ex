defmodule ReckonsDB.Portfolio do
  @moduledoc """
  """
  use Ecto.Schema
  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  @type t :: %__MODULE__{}

  schema "portfolios" do
    has_many(:properties, ReckonsDB.Property)

    field(:name, :string)
    timestamps()
  end
end
