defmodule ExceptionSampleTest do
  use ExUnit.Case
  doctest ExceptionSample

  test "greets the world" do
    assert ExceptionSample.hello() == :world
  end
end
