defmodule ReckonsAPI.Types.Property do
  use Absinthe.Schema.Notation

  object :property do
    field(:id, :id)
    field(:number_of_bedrooms, :integer)
    field(:rent_per_room, :integer)
    field(:contract_length, :integer)
    field(:stamp_duty, :integer)
    field(:mortgage_fees, :integer)
    field(:solicitors_fees, :integer)
  end

  input_object :create_property_input do
    field(:portfolio_id, non_null(:id))
  end

  input_object :property_input do
    field(:number_of_bedrooms, :integer)
    field(:rent_per_room, :integer)
    field(:contract_length, :integer)
    field(:stamp_duty, :integer)
    field(:mortgage_fees, :integer)
    field(:solicitors_fees, :integer)
  end
end
