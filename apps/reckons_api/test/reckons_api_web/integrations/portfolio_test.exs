defmodule ReckonsAPI.Integrations.PortfolioTest do
  use ReckonsAPI.GraphQLCase, async: true
  import ReckonsAPI.Factory

  describe "creating a portfolio" do
    test "creates a portfolio successfully for a given portfolio", %{conn: conn} do
      mutation = """
        mutation CreatePortfolio {
          createPortfolio (
            input: {
              name: "Spain"
            }
          ) {
            id
            name
          }
        }
      """

      res =
        conn
        |> graphql_mutation(mutation)

      new_id = res["data"]["createPortfolio"]["id"]
      new_portfolio = Repo.get!(ReckonsDB.Portfolio, new_id)

      assert new_portfolio.name == "Spain"
    end
  end

  describe "querying for a portfolio" do
    test "gets the id", %{conn: conn} do
      portfolio = insert(:portfolio)

      query = """
      {
        portfolio(id: "#{portfolio.id}") {
          id
          name
        }
      }
      """

      res =
        conn
        |> graphql_mutation(query)

      assert res["data"]["portfolio"] == %{
               "id" => "#{portfolio.id}",
               "name" => "Portsmouth"
             }
    end
  end

  describe "updating a portfolio" do
    setup %{conn: conn} do
      portfolio = insert(:portfolio)

      mutation = """
        mutation UpdatePortfolio {
          updatePortfolio(
            id: "#{portfolio.id}"
            input: {
              name: "Spain"
            }
          ) {
            name
            id
          }
        }
      """

      res =
        conn
        |> graphql_mutation(mutation)

      %{
        response: res["data"]["updatePortfolio"],
        updated_portfolio: ReckonsDB.Repo.get!(ReckonsDB.Portfolio, portfolio.id),
        portfolio: portfolio
      }
    end

    test "updates a portfolio for a given deal", %{response: response, portfolio: portfolio} do
      assert response == %{
               "id" => "#{portfolio.id}",
               "name" => "Spain"
             }
    end

    test "updates the portfolio in the database", %{
      updated_portfolio: updated_portfolio
    } do
      expected_portfolio = %{
        name: "Spain"
      }

      updated_portfolio =
        updated_portfolio
        |> Map.take(Map.keys(expected_portfolio))

      assert updated_portfolio.name == "Spain"
    end
  end

  describe "deleting a portfolio" do
    test "deletes a portfolio all well and good like", %{conn: conn} do
      portfolio = insert(:portfolio)

      mutation = """
        mutation DeletePortfolio {
          deletePortfolio(
            id: "#{portfolio.id}"
          ) {
            id
          }
        }
      """

      res =
        conn
        |> graphql_mutation(mutation)

      assert res["data"]["deletePortfolio"]["id"] == "#{portfolio.id}"
      assert is_nil(ReckonsDB.Repo.get(ReckonsDB.Portfolio, portfolio.id))
    end
  end
end
