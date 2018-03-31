defmodule ReckonsAPIWeb.PageController do
  use ReckonsAPIWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
