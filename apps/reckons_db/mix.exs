defmodule ReckonsDB.MixProject do
  use Mix.Project

  def project do
    [
      app: :reckons_db,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ReckonsDB.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"},
      {:ex_machina, "~> 2.0", only: [:dev, :test]}
    ]
  end

  defp aliases() do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "ecto.test.prepare": ["ecto.drop", "ecto.create", "ecto.load"],
      # Always dump the structure after a migration
      "db.migrate": ["ecto.migrate", "ecto.dump"],
      # Always dump the structure after a migration
      "db.rollback": ["ecto.rollback", "ecto.dump"],
      test: ["ecto.create -r ReckonsDB.Repo --quiet", "ecto.migrate -r ReckonsDB.Repo", "test"]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support/factories", "test/support/fixtures"]
  defp elixirc_paths(_), do: ["lib"]
end
