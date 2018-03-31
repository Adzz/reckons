# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :reckons_api, namespace: ReckonsAPI

# Configures the endpoint
config :reckons_api, ReckonsAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KiralcfGmItbILIXyzpjT8UPvsPMhECPFPssx+wBfnR1pIk6y1v+Ox6KnJ/Uppqv",
  render_errors: [view: ReckonsAPIWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ReckonsAPI.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
