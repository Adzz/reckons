defmodule ReckonsAPI.Schema do
  use Absinthe.Schema
  import_types(ReckonsAPI.Types.Property)

  query do
    @desc "returns the requested fields for a property"
    field :property, type: :property do
      arg(:id, non_null(:id))

      resolve(&ReckonsAPI.PropertyResolver.find/2)
    end
  end

  mutation do
    @desc "Create a property for a portfolio"
    field :create_property, type: :property do
      arg(:input, :create_property_input)

      resolve(&ReckonsAPI.PropertyResolver.create/2)
    end

    @desc "Update a property"
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
  end
end
