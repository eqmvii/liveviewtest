defmodule LiveviewtestWeb.FormDemoLive do
  use Phoenix.LiveView

  @doc """
  Whenever a socket's assigns change, render/1 is automatically called
  """
  def render(assigns) do
    Phoenix.View.render(LiveviewtestWeb.PageView, "userform.html", assigns)
  end

  @doc """
  Called when the page first loads
  """
  def mount(session_data, socket) do
    IO.puts "mount called. Connected: #{connected?(socket)}"

    {:ok, assign(socket, html: "<p class='red'>\n  <strong>Hello, World.</strong>\n</p>", css: ".red {\n  color: red;\n}\n\n.blue {\n color: blue;\n}")}
  end

  def handle_event("change", %{"canvasform" => form_data}, socket) do
    IO.inspect form_data

    {:noreply, assign(socket, html: form_data["html"], css: form_data["css"])}
  end
end

