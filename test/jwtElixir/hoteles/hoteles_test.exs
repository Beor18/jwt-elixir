defmodule JwtElixir.HotelesTest do
  use JwtElixir.DataCase

  alias JwtElixir.Hoteles

  describe "hoteles" do
    alias JwtElixir.Hoteles.Hotel

    @valid_attrs %{name: "some name", price: 120.5}
    @update_attrs %{name: "some updated name", price: 456.7}
    @invalid_attrs %{name: nil, price: nil}

    def hotel_fixture(attrs \\ %{}) do
      {:ok, hotel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hoteles.create_hotel()

      hotel
    end

    test "list_hoteles/0 returns all hoteles" do
      hotel = hotel_fixture()
      assert Hoteles.list_hoteles() == [hotel]
    end

    test "get_hotel!/1 returns the hotel with given id" do
      hotel = hotel_fixture()
      assert Hoteles.get_hotel!(hotel.id) == hotel
    end

    test "create_hotel/1 with valid data creates a hotel" do
      assert {:ok, %Hotel{} = hotel} = Hoteles.create_hotel(@valid_attrs)
      assert hotel.name == "some name"
      assert hotel.price == 120.5
    end

    test "create_hotel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hoteles.create_hotel(@invalid_attrs)
    end

    test "update_hotel/2 with valid data updates the hotel" do
      hotel = hotel_fixture()
      assert {:ok, %Hotel{} = hotel} = Hoteles.update_hotel(hotel, @update_attrs)
      assert hotel.name == "some updated name"
      assert hotel.price == 456.7
    end

    test "update_hotel/2 with invalid data returns error changeset" do
      hotel = hotel_fixture()
      assert {:error, %Ecto.Changeset{}} = Hoteles.update_hotel(hotel, @invalid_attrs)
      assert hotel == Hoteles.get_hotel!(hotel.id)
    end

    test "delete_hotel/1 deletes the hotel" do
      hotel = hotel_fixture()
      assert {:ok, %Hotel{}} = Hoteles.delete_hotel(hotel)
      assert_raise Ecto.NoResultsError, fn -> Hoteles.get_hotel!(hotel.id) end
    end

    test "change_hotel/1 returns a hotel changeset" do
      hotel = hotel_fixture()
      assert %Ecto.Changeset{} = Hoteles.change_hotel(hotel)
    end
  end
end
