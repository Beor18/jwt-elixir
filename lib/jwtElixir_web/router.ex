defmodule JwtElixirWeb.Router do
  use JwtElixirWeb, :router

  alias JwtElixir.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", JwtElixirWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  scope "/api/v1", JwtElixirWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
  end

  scope "/api/v1", JwtElixirWeb.Hoteles do
    pipe_through :api
    resources "/hoteles", HotelController, except: [:new]
  end

  scope "/api/v1", JwtElixirWeb.Hoteles do
    pipe_through :api

    get "/hoteles", HotelController, :show
  end

  
end
