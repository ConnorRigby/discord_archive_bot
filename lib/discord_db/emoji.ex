defmodule DiscordDb.Emoji do
  use Ecto.Schema
  import Ecto.Query
  @primary_key {:id, :snowflake, autogenerate: false}
  schema "emojis" do
    # field :id, :snowflake, primary_key: :binary, skip_default_validation: true
    # field :id, :snowflake, primary_key: :binary, skip_default_validation: true
    field :name, :string
    field :user, :snowflake
    field :require_colons, :boolean
    field :managed, :boolean
    field :animated, :boolean
    timestamps()
  end

  def ingest(%{
    id: id,
    name: name,
    user: user,
    require_colons: require_colons,
    managed: managed,
    animated: animated,
    # roles: roles
  }) do
    # Exmoji.find_by_id(name)
    id = id || name
    emoji = %{
      id: id,
      name: name,
      user: user,
      require_colons: require_colons,
      managed: managed,
      animated: animated,
      # roles: roles,
    }
    case DiscordDb.Repo.one(from emoji in __MODULE__, where: emoji.id == ^id) do
      nil ->
        DiscordDb.Repo.insert!(struct!(__MODULE__, emoji))
      old ->
        old
        |> Ecto.Changeset.change(emoji)
        |> DiscordDb.Repo.update!()
    end
  end
end
