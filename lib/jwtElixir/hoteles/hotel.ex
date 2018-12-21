defmodule JwtElixir.Hoteles.Hotel do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hoteles" do
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(hotel, attrs) do
    hotel
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
