defmodule ReckonsBackendTest do
  use ExUnit.Case
  doctest ReckonsBackend

  test "greets the world" do
    assert ReckonsBackend.hello() == :world
  end
end
