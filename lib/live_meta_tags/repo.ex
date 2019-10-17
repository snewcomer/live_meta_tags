defmodule LiveMetaTags.Repo do
  use Ecto.Repo,
    otp_app: :live_meta_tags,
    adapter: Ecto.Adapters.Postgres
end
