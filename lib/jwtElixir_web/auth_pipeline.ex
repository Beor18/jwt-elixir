defmodule JwtElixirWeb.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :JwtElixirWeb
    module: JwtElixirWeb.Guardian,
    error_handler: JwtElixirWeb.AuthErrorHandler

    plug Guardian.Plug.VerifiHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardiand.Plug.LoadResource
end