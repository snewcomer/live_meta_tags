defmodule LiveMetaTagsWeb.Seo.Image do
  import LiveMetaTagsWeb.Router.Helpers, only: [static_url: 2]
  alias LiveMetaTagsWeb.Endpoint

  def social_image(_), do: static_image("/images/share.png")

  def fb_img(), do: static_image("/images/share/fb.png")

  def fb_image_width(_), do: "1200"

  def fb_image_height(_), do: "630"

  def twitter_img(), do: static_image("/images/share/twitter.png")

  defp static_image(path), do: static_url(Endpoint, path)
end

