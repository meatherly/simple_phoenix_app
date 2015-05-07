defmodule SimplePhoenixApp.Car do
  use SimplePhoenixApp.Web, :model

  schema "cars" do
    belongs_to :user, SimplePhoenixApp.User
    field :name, :string
    field :year, :integer

    timestamps
  end

  @required_fields ~w(name year)
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
