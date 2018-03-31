defmodule ReckonsDB.Repo.Migrations.LinkLoansToProperties do
  use Ecto.Migration

  def change do
    alter table(:loans) do
      add(:property_id, references(:properties), null: false)
    end
  end
end
