defmodule ReckonsAPI.Integrations.PropertyTest do
  use ReckonsAPI.GraphQLCase, async: true
  import ReckonsAPI.Factory

  describe "creating a property" do
    test "creates a property successfully for a given portfolio", %{conn: conn} do
      portfolio = insert(:portfolio)

      mutation = """
        mutation CreateProperty {
          createProperty (
            input: {
              portfolioId: "#{portfolio.id}"
            }
          ) {
            id
          }
        }
      """

      res =
        conn
        |> graphql_mutation(mutation)

      new_id = res["data"]["createProperty"]["id"]
      new_property = Repo.get!(ReckonsDB.Property, new_id)

      assert new_property.portfolio_id == portfolio.id
    end
  end

  describe "querying for a property" do
    test "gets the id", %{conn: conn} do
      property = insert(:property)

      query = """
      {
        property(id: "#{property.id}") {
          id
          numberOfBedrooms
          rentPerRoom
          contractLength
          stampDuty
          mortgageFees
          solicitorsFees
        }
      }
      """

      res =
        conn
        |> graphql_mutation(query)

      assert res["data"]["property"] == %{
               "id" => "#{property.id}",
               "contractLength" => 48,
               "mortgageFees" => 1000,
               "numberOfBedrooms" => 6,
               "rentPerRoom" => 100,
               "solicitorsFees" => 2000,
               "stampDuty" => 7800
             }
    end
  end

  describe "updating a property" do
    setup %{conn: conn} do
      property = insert(:property)

      mutation = """
        mutation UpdateProperty {
          updateProperty(
            id: "#{property.id}"
            input: {
              numberOfBedrooms: 4
              rentPerRoom: 80
              contractLength: 52
              stampDuty: 0
              mortgageFees: 2000
              solicitorsFees: 500
            }
          ) {
            numberOfBedrooms
            rentPerRoom
            contractLength
            stampDuty
            mortgageFees
            solicitorsFees
          }
        }
      """

      res =
        conn
        |> graphql_mutation(mutation)

      %{
        response: res["data"]["updateProperty"],
        updated_property: ReckonsDB.Repo.get!(ReckonsDB.Property, property.id)
      }
    end

    test "updates a property for a given deal", %{response: response} do
      assert response == %{
               "numberOfBedrooms" => 4,
               "rentPerRoom" => 80,
               "contractLength" => 52,
               "stampDuty" => 0,
               "mortgageFees" => 2000,
               "solicitorsFees" => 500
             }
    end

    test "updates the property in the database", %{
      updated_property: updated_property
    } do
      expected_property = %{
        number_of_bedrooms: 4,
        rent_per_room: 80,
        contract_length: 52,
        stamp_duty: 0,
        mortgage_fees: 2000,
        solicitors_fees: 500
      }

      updated_property =
        updated_property
        |> Map.take(Map.keys(expected_property))

      assert updated_property == expected_property
    end
  end

  describe "deleting a property" do
    test "deletes a property all well and good like", %{conn: conn} do
      property = insert(:property)

      mutation = """
        mutation DeleteProperty {
          deleteProperty(
            id: "#{property.id}"
          ) {
            id
          }
        }
      """

      res =
        conn
        |> graphql_mutation(mutation)

      assert res["data"]["deleteProperty"]["id"] == "#{property.id}"
      assert is_nil(ReckonsDB.Repo.get(ReckonsDB.Property, property.id))
    end
  end
end
