defmodule LiveviewtestWeb.ThermostatLive do
  use Phoenix.LiveView

  @doc """
  Whenever a socket's assigns change, render/1 is automatically called
  """
  def render(assigns) do
    ~L"""
    Current temperature: <%= @temperature %>
    """
  end

  @doc """
  Called 
  """
  def mount(session_data, socket) do
    IO.puts "mount called. Connected: #{connected?(socket)}"

    if connected?(socket), do: :timer.send_interval(1000, self(), :update)
    {:ok, assign(socket, :temperature, 0)}
  end

  def handle_info(:update, socket) do
    IO.puts "handle_info called"
    temperature = :rand.uniform(100)
    {:noreply, assign(socket, :temperature, temperature)}
  end
end

