defmodule RedditWeb.RegistrationController do
  use RedditWeb, :controller

  def sign_in(conn, _params) do
    render(conn, "sign_in.html")
  end

  def sign_up(conn, _params) do
    render(conn, "sign_up.html")
  end
end
