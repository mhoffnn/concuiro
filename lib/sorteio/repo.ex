defmodule Sorteio.Repo do
  use Ecto.Repo,
    otp_app: :sorteio,
    adapter: Ecto.Adapters.SQLite3
end
