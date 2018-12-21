defmodule JwtElixir.Repo.Migrations.CreateHoteles do
  use Ecto.Migration

  def change do
    create table(:hoteles) do
      add :name, :string
      add :price, :float

      timestamps()
    end

  end
end
