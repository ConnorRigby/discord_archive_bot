defmodule DiscordDb.NostrumConsumer do
  use Nostrum.Consumer
  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {Consumer, :start_link, [__MODULE__]}
    }
  end

  def handle_event(term) when is_tuple(term) do
    [event | params] = Tuple.to_list(term)
    params = List.delete_at(params, -1)
    ingest(event, params)
  end

  def ingest(:MESSAGE_REACTION_ADD, [reaction_add]) do
    IO.inspect(reaction_add, label: "MESSAGE_REACTION_ADD")
    DiscordDb.MessageReactionAdd.ingest(reaction_add)
    DiscordDbWeb.Endpoint.broadcast("message_reaction_adds_global_count", "reload", %{})
  end

  def ingest(:MESSAGE_REACTION_REMOVE, [reaction_remove]) do
    IO.inspect(reaction_remove, label: "MESSAGE_REACTION_REMOVE")
    DiscordDb.MessageReactionRemove.ingest(reaction_remove)
    DiscordDbWeb.Endpoint.broadcast("message_reaction_adds_global_count", "reload", %{})
  end

  def ingest(event, _params) do
    IO.inspect(event, label: "unhandled event")
  end
end
