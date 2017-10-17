defmodule SweetenerTest do
  use ExUnit.Case
  doctest Sweetener

  use Sweetener

  test "tap {:ok, _}" do
    tapped = tap {:ok, 42} do
               42 = _()
               :error
             end
    assert tapped == {:ok, 42}
  end

  test "tap _" do
    tapped = tap 42 do
               42 = _()
               :error
             end
    assert tapped == 42
  end
end
