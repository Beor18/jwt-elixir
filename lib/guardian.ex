defmodule JwtElixir.Guardian do
  use Guardian, otp_app: :jwtElixir

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = JwtElixir.Accounts.get_user!(id)
    {:ok,  resource}
  end

  def resource_from_clai(claims) do
    id = claims["sub"]
    hotel = JwtElixir.Hoteles.get_hotel!(id)
    {:ok, hotel}
  end

end