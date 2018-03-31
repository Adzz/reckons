defmodule ReckonsDB.Repo.Migrations.CreatePortfolioTable do
  use Ecto.Migration

  def change do
    create table("portfolios") do
      add(:name, :text, comment: "the name of the portfolio")

      timestamps()
    end
  end
end
