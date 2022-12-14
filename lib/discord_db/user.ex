defmodule DiscordDb.User do
  use Ecto.Schema
  @primary_key false
  schema "users" do
    field :id, :snowflake, primary_key: true
    field :username, :string
    field :discriminator, :string
    field :avatar, :string
    field :bot, :boolean
    field :mfa_enabled, :boolean
    field :verified, :boolean
    field :email, :string
    # field :public_flags, :map
    # field :nick, :string
    # field :roles, :array
    # field :deaf, :boolean
    # field :mute, :boolean
    # field :communication_disabled_until, :utc_datetime
    # field :premium_since, :utc_datetime
    has_many :reactions, DiscordDb.MessageReactionAdd, references: :id
    timestamps()
  end

  def ingest(%{
    id: id,
    username: username,
    discriminator: discriminator,
    avatar: avatar,
    bot: bot,
    mfa_enabled: mfa_enabled,
    verified: verified,
    email: email
  }) do
    user = %{
      id: id,
      username: username,
      discriminator: discriminator,
      avatar: avatar,
      bot: bot,
      mfa_enabled: mfa_enabled,
      verified: verified,
      email: email,
      # nick: nick,
      # deaf: deaf,
      # mute: mute,
      # communication_disabled_until: communication_disabled_until,
      # premium_since: premium_since,
    }
    case DiscordDb.Repo.get(__MODULE__, id) do
      nil -> DiscordDb.Repo.insert!(struct!(__MODULE__, user))
      old ->
        old
        |> Ecto.Changeset.change(user)
        |> DiscordDb.Repo.update!()
    end
  end
end
