use Mix.Config

config :reckons_db, ReckonsDB.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: {:system, "PG_DATABASE_USER", "postgres"},
  password: {:system, "PG_DATABASE_PASSWORD", "postgres"},
  database: {:system, "PG_DATABASE_DB", "reckons_test"},
  hostname: {:system, "PG_DATABASE_HOST", "127.0.0.1"},
  port: {:system, :integer, "PG_DATABASE_PORT", 54321},
  pool: Ecto.Adapters.SQL.Sandbox,
  # Super long timeout to avoid interrupting pry sessions
  ownership_timeout: 999_999_999
