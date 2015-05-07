defmodule SimplePhoenixApp.CarTest do
  use SimplePhoenixApp.ModelCase

  alias SimplePhoenixApp.Car

  @valid_attrs %{name: "some content", year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Car.changeset(%Car{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Car.changeset(%Car{}, @invalid_attrs)
    refute changeset.valid?
  end
end
