defmodule ReckonsDBTest do
  use ExUnit.Case
  doctest ReckonsDB

  test "greets the world" do
    assert ReckonsDB.hello() == :world
  end
end
