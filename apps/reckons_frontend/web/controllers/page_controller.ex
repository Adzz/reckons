defmodule ReckonsFrontend.PageController do
  use ReckonsFrontend.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
