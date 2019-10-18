# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveMetaTracks.Repo.insert!(%LiveMetaTracks.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
#
alias LiveMetaTags.Repo
alias LiveMetaTags.Library.{Album, Track}

albums = [
  %{
    title: "Twinkle Twinkle",
    description: "little start how I wonder",
    img: "https://via.placeholder.com/150",
    url: "https://www.music.com/twinkle"
  },
  %{
    title: "Ba Ba",
    description: "a story about sheep",
    img: "https://via.placeholder.com/150",
    url: "https://www.music.com/ba-ba"
  },
]

case Repo.all(Album) do
  [] ->
    albums
    |> Enum.map(fn params ->
      Album.changeset(%Album{}, params)
      |> Repo.insert!()
    end)

  _ ->
    IO.puts("Albums detected, aborting track insert")
end

twinkle = Repo.get_by!(Album, title: "Twinkle Twinkle")
baba = Repo.get_by!(Album, title: "Ba Ba")

tracks = [
  %{
    name: "star",
    duration: "910",
    subtitle: "bright color planet",
    url: "https://www.music.com/star",
    img: "https://via.placeholder.com/50",
    price: "$1.99",
    album_id: twinkle.id
  },
  %{
    name: "wonder",
    duration: "113",
    subtitle: "look in amazement",
    url: "https://www.music.com/wonder",
    img: "https://via.placeholder.com/50",
    price: "$1.99",
    album_id: twinkle.id
  },
  %{
    name: "bright",
    duration: "781",
    subtitle: "the brightest star",
    url: "https://www.music.com/bright",
    img: "https://via.placeholder.com/50",
    price: "$2.99",
    album_id: twinkle.id
  },
  %{
    name: "little",
    duration: "200",
    subtitle: "some starts are little",
    url: "https://www.music.com/little",
    img: "https://via.placeholder.com/50",
    price: "$2.99",
    album_id: twinkle.id
  },
  %{
    name: "what",
    duration: "400",
    subtitle: "what are you",
    url: "https://www.music.com/what",
    img: "https://via.placeholder.com/50",
    price: "$1.99",
    album_id: twinkle.id
  },
  %{
    name: "sheep",
    duration: "193",
    subtitle: "Do sheep ba ba",
    url: "https://www.music.com/sheep",
    img: "https://via.placeholder.com/50",
    price: "$3.99",
    album_id: baba.id
  },
  %{
    name: "wool",
    duration: "515",
    subtitle: "sheep make wool",
    url: "https://www.music.com/wool",
    img: "https://via.placeholder.com/50",
    price: "$5.99",
    album_id: baba.id
  },
  %{
    name: "three bags",
    duration: "233",
    subtitle: "You can fill three bags",
    url: "https://www.music.com/three-bags",
    img: "https://via.placeholder.com/50",
    price: "$1.99",
    album_id: baba.id
  }
]

case Repo.all(Track) do
  [] ->
    tracks
    |> Enum.map(fn params ->
      Track.changeset(%Track{}, params)
      |> Repo.insert!()
    end)

  _ ->
    IO.puts("Tracks detected, aborting track insert")
end

