defmodule DiscordDb.Repo.Migrations.AddMessageReactionAddView do
  use Ecto.Migration

  def change do
    execute """
    CREATE VIEW message_reaction_adds_global_count AS
      SELECT COUNT(*) AS count, emojis.*,users.username,users.discriminator
      FROM message_reaction_adds
      INNER JOIN emojis
      ON message_reaction_adds.emoji_id = emojis.id
      INNER JOIN users
      ON message_reaction_adds.user_id = users.id
      GROUP BY emojis.name
      ORDER BY count DESC,name DESC;
    """, """
    DROP VIEW message_reaction_adds_global_count;
    """
  end
end
