defmodule DiscordDb.Repo do
  use Ecto.Repo,
    otp_app: :discord_db,
    adapter: Ecto.Adapters.SQLite3
end
