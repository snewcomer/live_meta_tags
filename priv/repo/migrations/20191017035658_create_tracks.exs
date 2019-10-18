defmodule LiveMetaTags.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :name, :string
      add :duration, :string
      add :subtitle, :string
      add :price, :string
      add :url, :string
      add :img, :string
      add :album_id, references(:albums, on_delete: :nothing)

      timestamps()
    end

    create index(:tracks, [:album_id])
  end
end
