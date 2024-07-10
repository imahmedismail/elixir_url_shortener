defmodule ElixirUrlShortener.ShortenedUrls do
  alias ElixirUrlShortener.{ShortenedUrl, Repo}

  def insert_shortened_url(original_url, shortened_url) do
    Repo.insert(%ShortenedUrl{original_url: original_url, shortened_url: shortened_url})
  end

  def get_shortened_url(shortened_url) do
    Repo.get_by(ShortenedUrl, shortened_url: shortened_url)
  end
end
