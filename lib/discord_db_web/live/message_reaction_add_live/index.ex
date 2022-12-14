defmodule DiscordDbWeb.MessageReactionAddLive.Index do
  use DiscordDbWeb, :live_view

  alias DiscordDb.Browser
  alias DiscordDb.MessageReactionAdd

  @impl true
  def mount(_params, _session, socket) do
    socket.endpoint.subscribe("message_reaction_adds_global_count")
    {:ok, assign(socket, :message_reaction_add_collection, list_message_reaction_add())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def handle_info(%{topic: "message_reaction_adds_global_count"}, socket) do
    {:noreply, assign(socket, :message_reaction_add_collection, list_message_reaction_add())}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Message reaction add")
    |> assign(:message_reaction_add, %MessageReactionAdd{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Message reaction add")
    |> assign(:message_reaction_add, nil)
  end


  defp list_message_reaction_add do
    Browser.list_message_reaction_add()
  end
end
