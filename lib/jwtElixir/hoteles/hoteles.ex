defmodule JwtElixir.Hoteles do
  @moduledoc """
  The Hoteles context.
  """

  import Ecto.Query, warn: false
  alias JwtElixir.Repo

  alias JwtElixir.Hoteles.Hotel

  @doc """
  Returns the list of hoteles.

  ## Examples

      iex> list_hoteles()
      [%Hotel{}, ...]

  """
  def list_hoteles do
    Repo.all(Hotel)
  end

  @doc """
  Gets a single hotel.

  Raises `Ecto.NoResultsError` if the Hotel does not exist.

  ## Examples

      iex> get_hotel!(123)
      %Hotel{}

      iex> get_hotel!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hotel!(id), do: Repo.get!(Hotel, id)

  @doc """
  Creates a hotel.

  ## Examples

      iex> create_hotel(%{field: value})
      {:ok, %Hotel{}}

      iex> create_hotel(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hotel(attrs \\ %{}) do
    %Hotel{}
    |> Hotel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hotel.

  ## Examples

      iex> update_hotel(hotel, %{field: new_value})
      {:ok, %Hotel{}}

      iex> update_hotel(hotel, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hotel(%Hotel{} = hotel, attrs) do
    hotel
    |> Hotel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hotel.

  ## Examples

      iex> delete_hotel(hotel)
      {:ok, %Hotel{}}

      iex> delete_hotel(hotel)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hotel(%Hotel{} = hotel) do
    Repo.delete(hotel)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hotel changes.

  ## Examples

      iex> change_hotel(hotel)
      %Ecto.Changeset{source: %Hotel{}}

  """
  def change_hotel(%Hotel{} = hotel) do
    Hotel.changeset(hotel, %{})
  end
end
