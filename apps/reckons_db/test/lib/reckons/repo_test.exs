defmodule ReckonsDB.RepoTest do
  alias ReckonsDB.Repo
  use ExUnit.Case, async: true

  describe "get_Record_by_id/2" do
    test "returns error tuple if not found" do
      assert Repo.get_record_by_id(ReckonsDB.Property, 666) ==
               {:error, "Elixir.ReckonsDB.Property with id 666 not found"}
    end
  end
end
