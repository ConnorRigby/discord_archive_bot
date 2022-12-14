defmodule DiscordDb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DiscordDb.Repo,
      # Start the Telemetry supervisor
      DiscordDbWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DiscordDb.PubSub},
      # Start the Endpoint (http/https)
      DiscordDbWeb.Endpoint,
      # Start a worker by calling: DiscordDb.Worker.start_link(arg)
      DiscordDb.NostrumConsumer
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DiscordDb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DiscordDbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
