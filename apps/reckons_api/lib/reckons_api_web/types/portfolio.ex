defmodule ReckonsAPI.Types.Portfolio do
  use Absinthe.Schema.Notation

  object :portfolio do
    field(:id, :id)
    field(:name, :string)
  end

  input_object :portfolio_input do
    field(:name, :string)
  end
end
