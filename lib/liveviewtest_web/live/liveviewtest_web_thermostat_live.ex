defmodule LiveviewtestWeb.ThermostatLive do
  use Phoenix.LiveView

  @doc """
  Whenever a socket's assigns change, render/1 is automatically called
  """
  def render(assigns) do
    Phoenix.View.render(LiveviewtestWeb.PageView, "lvtest.html", assigns)
    # alternatively, can render a live sigil like this:
    # ~L"""
    # <p>Current temperature: <%= @temperature %><p>
    # <p>
    #   <button phx-click="inc_temperature">Increase Temp By 1000</button>
    #   <button phx-click="dec_temperature">Decrease Temp By 1000</button>
    # </p>
    # <p>Random temperature increases: <%= @i %></p>
    # """
  end

  @doc """
  Called when the page first loads
  """
  def mount(session_data, socket) do
    IO.puts "mount called. Connected: #{connected?(socket)}"

    if connected?(socket), do: :timer.send_interval(500, self(), :set_interval_update)
    {:ok, assign(socket, temperature: 0, i: 0)}
  end

  def handle_info(:set_interval_update, socket) do
    IO.puts "handle_info called"
    new_temp = socket.assigns.temperature + :rand.uniform(3)
    {:noreply, assign(socket, temperature: new_temp, i: socket.assigns.i + 1)}
  end

  @doc """
  Event handler for the phx-click attribute on the button
  """
  def handle_event("inc_temperature", _value, %{assigns: %{temperature: temp}} = socket) do
    IO.puts "handle_event called"
    new_temp = temp + 1000
    {:noreply, assign(socket, :temperature, new_temp)}
  end

  def handle_event("dec_temperature", _value, %{assigns: %{temperature: temp}} = socket) do
    IO.puts "handle_event called"
    new_temp = temp - 1000
    {:noreply, assign(socket, :temperature, new_temp)}
  end
end

