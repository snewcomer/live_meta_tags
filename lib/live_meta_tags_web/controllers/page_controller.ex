defmodule LiveMetaTagsWeb.PageController do
  use LiveMetaTagsWeb, :controller

  alias LiveMetaTags.Library

  def index(conn, _params) do
    albums = Library.list_albums()
    render(conn, "index.html", albums: albums)
  end
end
