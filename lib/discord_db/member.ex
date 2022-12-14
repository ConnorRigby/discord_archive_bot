defmodule DiscordDb.Member do
  use Ecto.Schema

  @primary_key false

  schema "members" do
    field :user_id, :snowflake
    field :guild_id, :snowflake
  end

  def ingest(guild_id, %{
    user: %{id: user_id} = user,
  } =  _params) do
    user = DiscordDb.User.ingest(user)
    member = %{
      user_id: user.id,
      guild_id: guild_id
    }
    import Ecto.Query
    get = DiscordDb.Repo.one(from m in __MODULE__, where: m.user_id == ^user_id and m.guild_id == ^guild_id)
    case get do
      nil -> DiscordDb.Repo.insert(struct!(__MODULE__, member))
      old -> old
        # old
        # |> Ecto.Changeset.change(member)
        # |> DiscordDb.Repo.update!()
    end
  end
end
