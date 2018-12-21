defmodule JwtElixirWeb.Hoteles.HotelController do
  use JwtElixirWeb, :controller

  alias JwtElixir.Hoteles
  alias JwtElixir.Hoteles.Hotel

  action_fallback JwtElixirWeb.FallbackController

  def index(conn, _params) do
    hoteles = Hoteles.list_hoteles()
    render(conn, "index.json", hoteles: hoteles)
  end

  def create(conn, %{"hotel" => hotel_params}) do
    with {:ok, %Hotel{} = hotel} <- Hoteles.create_hotel(hotel_params) do
      conn
      |> render("show.json", hotel: hotel)
    end
  end

  def show(conn, %{"id" => id}) do
    hotel = Hoteles.get_hotel!(id)
    render(conn, "show.json", hotel: hotel)
  end

  def update(conn, %{"id" => id, "hotel" => hotel_params}) do
    hotel = Hoteles.get_hotel!(id)

    with {:ok, %Hotel{} = hotel} <- Hoteles.update_hotel(hotel, hotel_params) do
      render(conn, "show.json", hotel: hotel)
    end
  end

  def delete(conn, %{"id" => id}) do
    hotel = Hoteles.get_hotel!(id)

    with {:ok, %Hotel{}} <- Hoteles.delete_hotel(hotel) do
      send_resp(conn, :no_content, "")
    end
  end
end
