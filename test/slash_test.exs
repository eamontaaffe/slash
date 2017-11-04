defmodule SlashTest do
  use ExUnit.Case
  doctest Slash

  test "greets the world" do
    assert Slash.hello() == :world
  end
end
