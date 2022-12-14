defmodule DiscordDb.MessageReactionAdd.GlobalCount do
  use Ecto.Schema
  @primary_key false
  @derive {Phoenix.Param, key: :id}
  schema "message_reaction_adds_global_count" do
    field :count, :integer
    field :id, :snowflake, primary_key: true
    field :name, :string
    field :require_colons, :boolean
    field :managed, :boolean
    field :animated, :boolean
    field :username, :string
    field :discriminator, :string
    timestamps()
  end
end
