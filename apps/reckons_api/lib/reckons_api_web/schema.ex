defmodule ReckonsAPI.Schema do
  use Absinthe.Schema
  import_types(ReckonsAPI.Types.Property)

  query do
    field :property, type: :property do
      arg(:id, non_null(:id))

      resolve(&ReckonsAPI.PropertyResolver.find/2)
    end
  end
end
