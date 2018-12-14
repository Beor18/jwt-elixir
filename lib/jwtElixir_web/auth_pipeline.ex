defmodule JwtElixir.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :JwtElixir,
    module: JwtElixir.Guardian,
    error_handler: JwtElixir.AuthErrorHandler

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
end