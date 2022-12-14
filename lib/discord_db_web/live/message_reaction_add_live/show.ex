defmodule DiscordDbWeb.MessageReactionAddLive.Show do
  use DiscordDbWeb, :live_view

  alias DiscordDb.Browser

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:message_reaction_add, Browser.get_message_reaction_add!(id))}
  end

  defp page_title(:show), do: "Show Message reaction add"
  defp page_title(:edit), do: "Edit Message reaction add"
end
