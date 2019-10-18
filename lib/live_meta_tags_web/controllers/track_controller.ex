defmodule LiveMetaTagsWeb.TrackController do
  use LiveMetaTagsWeb, :controller

  alias LiveMetaTags.Library
  alias LiveMetaTags.Library.Track

  def index(conn, _params) do
    tracks = Library.list_tracks()
    render(conn, "index.html", tracks: tracks)
  end

  def new(conn, _params) do
    changeset = Library.change_track(%Track{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"track" => track_params}) do
    case Library.create_track(track_params) do
      {:ok, track} ->
        conn
        |> put_flash(:info, "Track created successfully.")
        |> redirect(to: Routes.track_path(conn, :show, track))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    track = Library.get_track!(id)
    render(conn, "show.html", track: track)
  end

  def edit(conn, %{"id" => id}) do
    track = Library.get_track!(id)
    changeset = Library.change_track(track)
    render(conn, "edit.html", track: track, changeset: changeset)
  end

  def update(conn, %{"id" => id, "track" => track_params}) do
    track = Library.get_track!(id)

    case Library.update_track(track, track_params) do
      {:ok, track} ->
        conn
        |> put_flash(:info, "Track updated successfully.")
        |> redirect(to: Routes.track_path(conn, :show, track))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", track: track, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    track = Library.get_track!(id)
    {:ok, _track} = Library.delete_track(track)

    conn
    |> put_flash(:info, "Track deleted successfully.")
    |> redirect(to: Routes.track_path(conn, :index))
  end
end
