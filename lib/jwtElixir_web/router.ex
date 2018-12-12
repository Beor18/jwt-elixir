defmodule JwtElixirWeb.Router do
  use JwtElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", JwtElixirWeb do
    pipe_through :api

    resources "/users", UserController, only: [:create, :show]
  end
end
