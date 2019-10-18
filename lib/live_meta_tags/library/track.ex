defmodule LiveMetaTags.Library.Track do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveMetaTags.Library.Album

  schema "tracks" do
    field :name, :string
    field :duration, :string
    field :subtitle, :string
    field :url, :string
    field :img, :string
    field :price, :string

    belongs_to :album, Album

    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:name, :duration, :subtitle, :price, :url, :img, :album_id])
    |> validate_required([:name, :album_id])
  end
end
