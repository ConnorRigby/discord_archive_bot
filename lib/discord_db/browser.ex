defmodule DiscordDb.Browser do
  import Ecto.Query
  alias DiscordDb.Repo
  alias DiscordDb.MessageReactionAdd

  def get_message_reaction_add!(id) do
    Repo.get!(MessageReactionAdd, id)
  end

  def list_message_reaction_add do
    # Repo.all(from mra in MessageReactionAdd, preload: [:user, :emoji])
    Repo.all(from mra in MessageReactionAdd.GlobalCount)
  end
end
