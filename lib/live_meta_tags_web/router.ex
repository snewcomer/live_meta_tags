defmodule LiveMetaTagsWeb.Router do
  use LiveMetaTagsWeb, :router

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

  scope "/", LiveMetaTagsWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/albums", AlbumController
    resources "/tracks", TrackController
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveMetaTagsWeb do
  #   pipe_through :api
  # end
end
