defmodule ElixirUrlShortener.ShortenedUrl do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shortened_urls" do
    field :original_url, :string
    field :shortened_url, :string
  end

  @doc false
  def changeset(shortened_url, attrs) do
    shortened_url
    |> cast(attrs, [:original_url, :shortened_url])
    |> validate_required([:original_url, :shortened_url])
  end

  def encode_url(url), do:
    :crypto.hash(:sha256, url) |> Base.encode16(case: :lower) |> String.slice(0..8)
end
