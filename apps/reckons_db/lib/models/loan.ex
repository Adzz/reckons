defmodule ReckonsDB.Loan do
  @moduledoc """
  """
  use Ecto.Schema
  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  @type t :: %__MODULE__{}

  schema "loans" do
    belongs_to(:property, ReckonsDB.Property, foreign_key: :property_id)

    field(:principal, :integer)
    field(:interest_rate, :float)
    field(:duration, :integer)
    field(:repayment_amount, :integer)

    timestamps()
  end
end
