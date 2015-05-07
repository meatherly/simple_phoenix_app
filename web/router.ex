defmodule SimplePhoenixApp.Router do
  use SimplePhoenixApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SimplePhoenixApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController do
      resources "/cars", CarController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", SimplePhoenixApp do
  #   pipe_through :api
  # end
end
