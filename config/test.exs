import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.

config :sorteio, Sorteio.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "sorteio.db"

config :sorteio,
  ecto_repos: [Sorteio.Repo]

  port = String.to_integer(System.get_env("PORT") || "4002")

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sorteio, SorteioWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: port],
  secret_key_base: "WC5Dt9SyKJw8/9iO7XZN17CLtfotqDff1lpcbpzu9YWCIh5s9N1BLucHSDafy85c",
  server: false

# In test we don't send emails.
config :sorteio, Sorteio.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
