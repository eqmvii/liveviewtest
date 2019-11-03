defmodule LiveviewtestWeb.FormDemoLive do
  use Phoenix.LiveView

  defstruct html: "",
            css: "",
            js: ""

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
    {:ok, assign(socket, state: initial_state())}
  end

  def handle_event("change", %{"canvasform" => form_data}, %{assigns: %{state: state}} = socket) do
    state =
      state
      |> Map.put(:html, form_data["html"])
      |> Map.put(:css, form_data["css"])
      |> Map.put(:js, form_data["js"])

    {:noreply, assign(socket, state: state)}
  end

  defp initial_state() do
    %__MODULE__{
      html: "<p class='red'>\n  <strong>Hello, World.</strong>\n</p>",
      css: ".red {\n  color: red;\n}\n\n.blue {\n color: blue;\n}",
      js: ""
    }
  end
end

