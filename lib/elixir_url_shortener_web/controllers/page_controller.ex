defmodule ElixirUrlShortenerWeb.PageController do
  use ElixirUrlShortenerWeb, :controller

  alias ElixirUrlShortener.{ShortenedUrls, ShortenedUrl}

  @base_url Application.compile_env(:elixir_url_shortener, :base_url)

  def index(conn, params) do
    render(conn, "index.html", shortened_url: if(params, do: params["shortened_url"], else: nil))
  end

  def shorten_url(conn, %{"original_url" => original_url}) do
    shortened_url = ShortenedUrl.encode_url(original_url)
    ShortenedUrls.insert_shortened_url(original_url, shortened_url)

    conn
    |> put_flash(:info, "Shortened URL created")
    |> redirect(to: Routes.page_path(conn, :index, shortened_url: "#{@base_url}/#{shortened_url}"))
  end

  def redirect_url(conn, %{"shortened_url" => shortened_url}) do
    case ShortenedUrls.get_shortened_url(shortened_url) do
      nil ->
        conn
        |> put_flash(:error, "Shortened URL not found")
        |> redirect(to: Routes.page_path(conn, :index))
      %ShortenedUrl{original_url: original_url} ->
        conn
        |> redirect(external: original_url)
    end
  end
end
