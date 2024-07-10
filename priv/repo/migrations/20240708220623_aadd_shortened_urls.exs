defmodule ElixirUrlShortener.Repo.Migrations.AaddShortenedUrls do
  use Ecto.Migration

  def up do
    create table(:shortened_urls) do
      add :original_url, :string
      add :shortened_url, :string
    end
  end

  def down do
    drop table(:shortened_urls)
  end
end
