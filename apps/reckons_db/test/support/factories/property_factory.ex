defmodule ReckonsDB.PropertyFactory do
  @moduledoc """
  Factory for ReckonsDB.Property
  """
  defmacro __using__(_) do
    quote do
      def property_factory do
        %ReckonsDB.Property{
          number_of_bedrooms: 6,
          rent_per_room: 100,
          contract_length: 48,
          stamp_duty: 7800,
          mortgage_fees: 1000,
          solicitors_fees: 2000,
          portfolio: build(:portfolio)
        }
      end
    end
  end
end
