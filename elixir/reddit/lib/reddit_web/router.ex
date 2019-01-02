defmodule RedditWeb.Router do
  use RedditWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RedditWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/sign_in", SessionController, :sign_in
    delete "/logout", SessionController, :destroy
    get "/sign_up", RegistrationController, :sign_up
  end
end
