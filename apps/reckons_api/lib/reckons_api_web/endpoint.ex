defmodule ReckonsAPIWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :reckons_api
  use Absinthe.Phoenix.Endpoint

  plug(Plug.RequestId)
  plug(Plug.Logger)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug(Phoenix.CodeReloader)
  end

  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["*/*"],
    json_decoder: Jason,
    schema: ReckonsAPI.Schema
  )

  plug(Absinthe.Plug, schema: ReckonsAPI.Schema)

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
