defmodule ReckonsDB.Property do
  @moduledoc """
  """
  use Ecto.Schema

  @type t :: %__MODULE__{}

  schema "properties" do
    belongs_to(:portfolio, ReckonsDB.Portfolio, foreign_key: :portfolio_id)
    has_many(:loans, ReckonsDB.Loan)

    field(:number_of_bedrooms, :integer)
    field(:rent_per_room, :integer)
    field(:contract_length, :integer)
    field(:stamp_duty, :integer)
    field(:mortgage_fees, :integer)
    field(:solicitors_fees, :integer)

    timestamps()
  end
end
