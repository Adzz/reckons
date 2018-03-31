defmodule ReckonsAPIWeb.Router do
  use ReckonsAPIWeb, :router

  pipeline :graphql do
    plug(Plug.Logger)
    plug(ReckonsAPI.AbsintheContext)
  end

  scope "/graphql" do
    pipe_through(:graphql)

    forward(
      "/",
      Absinthe.Plug,
      schema: ReckonsAPI.Schema,
      json_codec: Jason
    )
  end

  if Mix.env() == :dev do
    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: ReckonsAPI.Schema,
      json_codec: Jason,
      default_url: "/graphql",
      interface: :advanced
    )
  end
end
