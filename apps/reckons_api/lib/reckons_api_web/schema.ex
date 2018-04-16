defmodule ReckonsAPI.Schema do
  use Absinthe.Schema
  import_types(ReckonsAPI.Types.Property)
  import_types(ReckonsAPI.Types.Portfolio)

  query do
    @desc "returns the requested fields for a property"
    field :property, type: :property do
      arg(:id, non_null(:id))

      resolve(&ReckonsAPI.PropertyResolver.find/2)
    end

    @desc "returns the requested fields for a portfolio"
    field :portfolio, type: :portfolio do
      arg(:id, non_null(:id))

      resolve(&ReckonsAPI.PortfolioResolver.find/2)
    end
  end

  mutation do
    # Properties
    @desc "Creates a property for a portfolio"
    field :create_property, type: :property do
      arg(:input, :create_property_input)

      resolve(&ReckonsAPI.PropertyResolver.create/2)
    end

    @desc "Updates a property"
    field :update_property, type: :property do
      arg(:id, non_null(:id))
      arg(:input, :property_input)

      resolve(&ReckonsAPI.PropertyResolver.update/2)
    end

    @desc "Deletes a property"
    field :delete_property, type: :property do
      arg(:id, non_null(:id))

      resolve(&ReckonsAPI.PropertyResolver.delete/2)
    end

    # Portfolios

    @desc "Creates a portfolio"
    field :create_portfolio, type: :portfolio do
      arg(:input, :portfolio_input)

      resolve(&ReckonsAPI.PortfolioResolver.create/2)
    end

    @desc "Updates a portfolio"
    field :update_portfolio, type: :portfolio do
      arg(:id, non_null(:id))
      arg(:input, :portfolio_input)

      resolve(&ReckonsAPI.PortfolioResolver.update/2)
    end

    @desc "Deletes a portfolio"
    field :delete_portfolio, type: :portfolio do
      arg(:id, non_null(:id))

      resolve(&ReckonsAPI.PortfolioResolver.delete/2)
    end
  end
end
