ExUnit.start()
{:ok, _} = Application.ensure_all_started(:ex_machina)
Ecto.Adapters.SQL.Sandbox.mode(ReckonsDB.Repo, :manual)

# Ecto.Adapters.SQL.Sandbox.unboxed_run(ReckonsDB.Repo, fn ->
#   ReckonsDB.Fixtures.populate()
# end)
