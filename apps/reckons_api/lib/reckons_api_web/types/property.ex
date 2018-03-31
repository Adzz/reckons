defmodule ReckonsAPI.Types.Property do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ReckonsDB.Repo

  object :property do
    field(:id, :id)
  end
end
