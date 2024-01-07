defmodule GlimpseTest do
  use ExUnit.Case
  doctest Glimpse

  test "greets the world" do
    assert Glimpse.hello() == :world
  end
end
