defmodule DiscordDb.Repo.Migrations.AddReactionsTable do
  use Ecto.Migration

  def change do
    create table(:message_reaction_adds, primary_key: false) do
      add :_id, :integer, primary_key: true, autogenerate: true
      add :user_id, :snowflake
      add :channel_id, :snowflake
      add :message_id, :snowflake
      add :guild_id, :snowflake
      add :emoji_id, :snowflake
      timestamps()
    end
  end
end
