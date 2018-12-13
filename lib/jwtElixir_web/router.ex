defmodule JwtElixirWeb.Router do
  use JwtElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", JwtElixirWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
  end
end
