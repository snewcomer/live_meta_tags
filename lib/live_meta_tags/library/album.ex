defmodule LiveMetaTags.Library.Album do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveMetaTags.Library.Track

  schema "albums" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :img, :string

    has_many :tracks, Track

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:title, :url, :description, :img])
    |> validate_required([:title])
  end
end
