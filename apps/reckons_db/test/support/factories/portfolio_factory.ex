defmodule ReckonsDB.PortfolioFactory do
  @moduledoc """
  Factory for ReckonsDB.Portfolio
  """
  defmacro __using__(_) do
    quote do
      def portfolio_factory do
        %ReckonsDB.Portfolio{
          name: "Portsmouth"
        }
      end
    end
  end
end
