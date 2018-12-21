defmodule JwtElixirWeb.Hoteles.HotelView do
  use JwtElixirWeb, :view
  alias JwtElixirWeb.Hoteles.HotelView

  def render("index.json", %{hoteles: hoteles}) do
    %{data: render_many(hoteles, HotelView, "hotel.json")}
  end

  def render("show.json", %{hotel: hotel}) do
    %{data: render_one(hotel, HotelView, "hotel.json")}
  end

  def render("hotel.json", %{hotel: hotel}) do
    %{id: hotel.id,
      name: hotel.name,
      price: hotel.price}
  end
end
