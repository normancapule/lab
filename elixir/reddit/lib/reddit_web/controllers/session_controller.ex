defmodule RedditWeb.SessionController do
  use RedditWeb, :controller

  def sign_in(conn, _params) do
    render(conn, "sign_in.html")
  end
end
