# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :sorteio, Sorteio.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "d5tgbh89m19fid",
  hostname: "ec2-54-147-33-38.compute-1.amazonaws.com",
  port: "5432",
  password: "b9ad76fc0cd68c3f55e4372e7c516030041021151bb272fcf4e46b68f0ba65ba",
  username: "yorpxlhtblwteh",
  url: "postgres://yorpxlhtblwteh:b9ad76fc0cd68c3f55e4372e7c516030041021151bb272fcf4e46b68f0ba65ba@ec2-54-147-33-38.compute-1.amazonaws.com:5432/d5tgbh89m19fid"

config :sorteio,
  ecto_repos: [Sorteio.Repo]

# Configures the endpoint
config :sorteio, SorteioWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SorteioWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Sorteio.PubSub,
  live_view: [signing_salt: "mpp3lRae"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :sorteio, Sorteio.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
