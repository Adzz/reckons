defmodule ReckonsDB.PropertyFactory do
  @moduledoc """
  Factory for ReckonsDB.Property
  """
  defmacro __using__(_) do
    quote do
      def property_factory do
        %ReckonsDB.Property{
          number_of_bedrooms: 1,
          portfolio: build(:portfolio)
        }
      end
    end
  end
end
