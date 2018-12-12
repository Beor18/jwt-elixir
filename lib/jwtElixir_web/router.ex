defmodule JwtElixirWeb.Router do
  use JwtElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JwtElixirWeb do
    pipe_through :api
  end
end
