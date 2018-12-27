defmodule RedditWeb.PageController do
  use RedditWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
