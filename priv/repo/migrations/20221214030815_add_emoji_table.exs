defmodule DiscordDb.Repo.Migrations.AddEmojiTable do
  use Ecto.Migration

  def change do
    create table(:emojis, primary_key: false) do
      add :id, :snowflake, primary_key: true#, description: "emoji id"
      add :name, :string#, description: "(can be null only in reaction emoji objects) emoji name"
      # add :roles, :array#, description: "of role object ids roles allowed to use this emoji"
      add :user, :user#, description: "object user that created this emoji"
      add :require_colons, :boolean#, description: "whether this emoji must be wrapped in colons"
      add :managed, :boolean#, description: "whether this emoji is managed"
      add :animated, :boolean#, description: "whether this emoji is animated"
      add :available, :boolean#, description: "whether this emoji can be used, may be false due to loss of Server Boosts"
      timestamps()
    end
  end
end
