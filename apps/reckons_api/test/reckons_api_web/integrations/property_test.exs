defmodule ReckonsAPI.Integrations.PropertyTest do
  use ReckonsAPI.GraphQLCase, async: false
  import ReckonsAPI.Factory

  describe "querying for a property" do
    test "gets the id", %{conn: conn} do
      property = insert(:property)

      query = """
      {
        property(id: "#{property.id}") {
          id
        }
      }
      """

      res =
        conn
        |> graphql_mutation(query)

      new_id = res["data"]["property"]["id"]

      assert String.to_integer(new_id) == property.id
    end
  end
end
