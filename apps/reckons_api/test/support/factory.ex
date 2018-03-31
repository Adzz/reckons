defmodule ReckonsAPI.Factory do
  use ExMachina.Ecto, repo: ReckonsDB.Repo

  use ReckonsDB.{
    PropertyFactory,
    PortfolioFactory
  }
end
