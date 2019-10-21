defmodule LiveMetaTagsWeb.Seo.Schema do
  alias LiveMetaTagsWeb.TrackView
  import Phoenix.HTML

  def album_schema(album) do
    ~E"""
      <script name="schema:music-album" type="application/ld+json">
        {
          "@context": "http://schema.org",
          "@type": "MusicAlbum",
          "name": "<%= album.title %>",
          "description": "<%= album.description %>",
          "tracks": [
            <%= for track <- album.tracks do %>
              {
                "@type": "MusicRecording",
                "name": "<%= track.name %>",
                "audio": {"@type":"AudioObject"},
                "offers": {
                  "@type": "Offer",
                  "price": "<%= track.price %>"
                },
                "duration": "<%= track.duration %>"
              }
            <% end %>
          ]
        }
      </script>
    """
  end
end

