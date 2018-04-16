defmodule ReckonsDB.Portfolio do
  @moduledoc """
  Portfolios are the root of the data model. They have many `NestDB.Property`'s, and we roll from there
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
