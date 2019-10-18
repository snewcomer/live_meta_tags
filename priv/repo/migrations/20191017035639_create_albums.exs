defmodule LiveMetaTags.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :description, :string
      add :url, :string
      add :img, :string

      timestamps()
    end

  end
end
