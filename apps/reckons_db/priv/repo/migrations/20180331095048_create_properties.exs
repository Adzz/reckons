defmodule ReckonsDB.Repo.Migrations.CreateProperties do
  use Ecto.Migration

  def change do
    create table("properties") do
      add(:portfolio_id, references(:portfolios), null: false)
      add(:number_of_bedrooms, :integer)

      add(
        :rent_per_room,
        :integer,
        comment: """
          The £ amount we can charge for rent per room, per month.
        """
      )

      add(
        :contract_length,
        :integer,
        default: 48,
        comment: """
        This is the length of the contract in weeks. This defaults to 48 weeks, giving us a month
        to do maintenance on the property
        """
      )

      add(
        :stamp_duty,
        :integer,
        commment: "The total cost of SDLT for the purchase of the property"
      )

      add(
        :mortgage_fees,
        :integer,
        comment: "The cost of any mortgage fees for the initial purchase of the property"
      )

      add(
        :solicitors_fees,
        :integer,
        comment: "The cost of solicitors fees in £ for the purchase of the property"
      )

      timestamps()
    end
  end
end
