defmodule LiveMetaTagsWeb.LayoutView do
  use LiveMetaTagsWeb, :view

  import LiveMetaTagsWeb.Seo.{Title, Image, Schema, Description}
  alias LiveMetaTagsWeb.AlbumView

  def is_album(%{view_module: AlbumView}), do: true
  def is_album(_), do: false
end
