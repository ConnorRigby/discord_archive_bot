defmodule DiscordDb.MessageReactionAdd do
  use Ecto.Schema
  @primary_key false
  @derive {Phoenix.Param, key: :emoji_id}
  schema "message_reaction_adds" do
    # field :user_id, :snowflake
    belongs_to :user, DiscordDb.User
    field :channel_id, :snowflake
    field :message_id, :snowflake
    field :guild_id, :snowflake
    # field :emoji_id, :snowflake
    belongs_to :emoji, DiscordDb.Emoji, type: :snowflake
    timestamps()
  end

  def ingest(%{
    user_id: user_id,
    channel_id: channel_id,
    message_id: message_id,
    guild_id: guild_id,
    member: member,
    emoji: emoji
  } = _params) do
    _member = DiscordDb.Member.ingest(guild_id, member)
    emoji = DiscordDb.Emoji.ingest(emoji)
    message_reaction_add = %__MODULE__{
      user_id: user_id,
      channel_id: channel_id,
      message_id: message_id,
      guild_id: guild_id,
      emoji_id: emoji.id,
    }
    DiscordDb.Repo.insert!(message_reaction_add)
  end
end
