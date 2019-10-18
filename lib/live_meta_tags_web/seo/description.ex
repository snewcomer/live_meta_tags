defmodule LiveMetaTagsWeb.Seo.Description do
  alias LiveMetaTagsWeb.{AlbumView, TrackView}

  def description(assigns), do: get(assigns)

  defp get(%{view_module: AlbumView, album: album}) do
    truncate(album.description, 300)
  end

  defp get(%{view_module: TrackView, track: track}) do
    truncate(track.subtitle, 300)
  end

  defp get(_), do: "Your Music, Loud as Shit"

  def truncate(string, length) when is_binary(string) do
    if String.length(string) > length do
      String.slice(string, 0, length) <> "..."
    else
      string
    end
  end
  def truncate(_string, _length), do: ""
end

