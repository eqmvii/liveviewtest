defmodule Liveviewtest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      LiveviewtestWeb.Endpoint,
      # Redix connection useus 'host' and 'port' vs. a uri for a one-off connection like:
      # {:ok, conn} = Redix.start_link("redis://redis:6379/3", name: :redix)
      {Redix, host: "redis", port: 6379, name: :redix}
      # Starts a worker by calling: Liveviewtest.Worker.start_link(arg)
      # {Liveviewtest.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Liveviewtest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveviewtestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
