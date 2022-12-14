defmodule DiscordDbWeb.PageController do
  use DiscordDbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
