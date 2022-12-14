defmodule DiscordDb.Repo.Migrations.AddMembersTable do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :guild_id, :snowflake
      add :user_id, :snowflake
    end
  end
end
