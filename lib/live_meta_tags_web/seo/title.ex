defmodule LiveMetaTagsWeb.Seo.Title do
  alias LiveMetaTagsWeb.AlbumView

  def title(assigns), do: get(assigns)

  # Pages
  defp get(%{view_module: PageView, view_template: template}) do
    case template do
      "about.html" ->
        "About Musicc"
      "contact.html" ->
        "Contact Musicc"
    end
  end

  defp get(%{view_module: AlbumView, album: album}) do
    album.title
  end

  defp get(_), do: "Musicc"
end

