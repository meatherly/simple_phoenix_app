defmodule SimplePhoenixApp.CarController do
  use SimplePhoenixApp.Web, :controller

  alias SimplePhoenixApp.Car

  plug :find_user
  plug :scrub_params, "car" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    cars = Repo.all assoc(conn.assigns.user, :cars)

    render conn, cars: cars
  end

  def new(conn, _) do
    changeset = Car.changeset(%Car{})
    render conn, changeset: changeset
  end

  def create(conn, %{"car" => car_params}) do
    new_car = build(conn.assigns.user, :cars)
    changeset = Car.changeset(new_car, car_params)
    if changeset.valid? do
      Repo.insert(changeset)

      conn
        |> put_flash(:info, "Car has been successfully created.")
        |> redirect(to: user_car_path(conn, :index, conn.assigns.user))
    else
      render(conn, "new.html", changeset: changeset)
    end
    render conn, changeset
  end

  defp find_user(conn, _) do
    user = Repo.get(User, conn.params["user_id"])
    assign(conn, :user, user)
  end
end
