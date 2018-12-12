defmodule JwtElixir.Repo do
  use Ecto.Repo,
    otp_app: :jwtElixir,
    adapter: Ecto.Adapters.Postgres
end
