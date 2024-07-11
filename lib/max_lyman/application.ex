defmodule MaxLyman.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger

  use Application

  @impl true
  def start(_type, _args) do
    Logger.info("Starting MaxLyman Application")

    children = [
      MaxLymanWeb.Telemetry,
      # MaxLyman.Repo,
      {DNSCluster, query: Application.get_env(:max_lyman, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MaxLyman.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MaxLyman.Finch},
      # Start a worker by calling: MaxLyman.Worker.start_link(arg)
      # {MaxLyman.Worker, arg},
      # Start to serve requests, typically the last entry
      MaxLymanWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MaxLyman.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MaxLymanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
