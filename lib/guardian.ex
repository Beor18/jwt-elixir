defmodule JwtElixir.Guardian do
    use Guardian, otp_app: :jwtElixir

    def subject_for_token(user, claims) do
       sub = to_string(user.id)
       {:ok, sub} 
    end

    def subject_for_token(_, _) do
        {:error, :reason_for_error}
    end

    def resource_from_claims(claims) do
        id = claims["sub"]
        resource = JwtElixir.Accounts.get_user!(id)
        {:ok, resource}
    end

    def resource_from_claims(claims) do
        {:error, :reason_for_error}
    end
end