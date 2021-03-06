# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jwtElixir,
  ecto_repos: [JwtElixir.Repo]

# Configures the endpoint
config :jwtElixir, JwtElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lWkOaaJsW/MFDIXivzk8g5fTyQCZHX3VJY0hW3sV6Aq4ixuPttlzINVOBYOBIWUO",
  render_errors: [view: JwtElixirWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: JwtElixir.PubSub, adapter: Phoenix.PubSub.PG2]

config :jwtElixir, JwtElixir.Guardian,
  issuer: "jwtElixir",
  secret_key: "+it4fg8ZBuN/2cTixniZSOI6XFiXkiXmTKck/mmRSMAKzAIm7k3eo2HnPfdL2vbo"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
