defmodule JwtElixir.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias JwtElixir.Accounts.User

  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

# se agrega la lógica para las contraseñas de hash y la validación de datos de campo.
  
  schema "users" do
    field :email, :string
    field :password_hash, :string
    # Virtual fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end
  
  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash, :password_confirmation])
    |> validate_required([:email, :password_hash, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        ->
          put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
          changeset
    end
  end
end
