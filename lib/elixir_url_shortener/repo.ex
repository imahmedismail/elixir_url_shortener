defmodule ElixirUrlShortener.Repo do
  use Ecto.Repo,
    otp_app: :elixir_url_shortener,
    adapter: Ecto.Adapters.Postgres
end
