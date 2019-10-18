defmodule LiveMetaTagsWeb.Seo.Schema do
  alias LiveMetaTagsWeb.TrackView
  import Phoenix.HTML

  def album_schema(album) do
    ~E"""
      <script name="schema:music-album" type="application/ld+json">
        {
          "@context": "http://schema.org",
          "@type": "MusicAlbum",
          "name": <%= album.title %>,
          "description": <%= album.description %>,
          "tracks": [
            {
              "@type": "MusicRecording",
              "name": "My Track",
              "audio": {"@type":"AudioObject"},
              "offers": {
                "@type": "Offer",
                "price": "$1.29"
              },
              "duration": "PT2M50S"
            }
          ]
        }
      </script>
    """
  end
end

