defmodule LiveMetaTagsWeb.PageController do
  use LiveMetaTagsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
