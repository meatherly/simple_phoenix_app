defmodule SimplePhoenixApp.User do
  use SimplePhoenixApp.Web, :model

  schema "users" do
    has_many :cars, SimplePhoenixApp.Car
    field :name, :string
    field :email, :string

    timestamps
  end

  @required_fields ~w(name email)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
