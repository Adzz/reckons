# test/support/absinthe_helpers.ex
defmodule ReckonsAPI.GraphQLCase do
  defmacro __using__(opts \\ []) do
    quote do
      use ReckonsAPIWeb.ConnCase, unquote(opts)

      import ReckonsAPI.GraphQLCase
    end
  end

  @doc """
  Macro that takes context, a GraphQL query string and a query name.

  To use it you must first `use ReckonsAPI.GraphQLCase` in a test.

  It returns a map representing the successful GraphQL response. No provision
  is made for status 400 GraphQL syntax errors.
  """
  defmacro graphql_query(context, query, status \\ 200) do
    quote do
      unquote(context)
      |> post("/", query_skeleton(unquote(query)))
      |> json_response(unquote(status))
    end
  end

  @doc """
  Macro that takes context, a GraphQL mutation string and a query name.

  To use it you must first `use ReckonsAPI.GraphQLCase` in a test.

  It returns a map representing the successful GraphQL response. No provision
  is made for status 400 GraphQL syntax errors.
  """
  defmacro graphql_mutation(context, query, status \\ 200) do
    quote do
      unquote(context)
      |> post("/", mutation_skeleton(unquote(query)))
      |> json_response(unquote(status))
    end
  end

  def query_skeleton(query) do
    %{
      "query" => "query #{query}",
      "variables" => "{}"
    }
  end

  def mutation_skeleton(query) do
    %{
      "query" => "#{query}",
      "variables" => ""
    }
  end
end
