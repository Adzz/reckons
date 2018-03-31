defmodule ReckonsDB.Repo.Migrations.CreateLoans do
  use Ecto.Migration

  def change do
    create table("loans") do
      add(:principal, :integer, comment: "The amount borrowed")
      add(:interest_rate, :float, comment: "the inerest rate as a decimal for the loan")
      add(:duration, :integer, comment: "The length of the loan in months")

      add(
        :repayment_amount,
        :integer,
        comment: "The amount in £ that each repayment costs. It is assumed repayments are monthly"
      )

      timestamps()
    end
  end
end
