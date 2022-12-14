defmodule DiscordDb.MessageReactionRemove do
  import Ecto.Query

  def ingest(%{
    user_id: user_id,
    channel_id: channel_id,
    message_id: message_id,
    guild_id: guild_id,
    emoji: emoji
  }) do
    emoji = DiscordDb.Emoji.ingest(emoji)
    emoji_id = emoji.id || emoji.name
    query = from mra in DiscordDb.MessageReactionAdd,
    where:
    mra.user_id == ^user_id and
    mra.channel_id == ^channel_id and
    mra.message_id == ^message_id and
    mra.emoji_id == ^emoji_id and
    mra.guild_id == ^guild_id

    DiscordDb.Repo.delete_all(query)
  end
end
