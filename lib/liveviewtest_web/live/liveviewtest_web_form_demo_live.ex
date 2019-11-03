defmodule LiveviewtestWeb.FormDemoLive do
  use Phoenix.LiveView

  defstruct html: "",
            css: "",
            js: "",
            show_html: false,
            show_css: false,
            show_js: false

  #
  # Lifecycle Methods
  #

  def render(assigns) do
    Phoenix.View.render(LiveviewtestWeb.PageView, "htmlpreview.html", assigns)
  end

  def mount(session_data, socket) do
    {:ok, assign(socket, state: initial_state())}
  end

  #
  # Event Listeners
  #

  def handle_event("change", %{"canvasform" => form_data}, %{assigns: %{state: state}} = socket) do
    state =
      state
      |> Map.put(:html, form_data["html"])
      |> Map.put(:css, form_data["css"])
      |> Map.put(:js, form_data["js"])

    {:noreply, assign(socket, state: state)}
  end

  def handle_event("toggle", %{"value" => value}, %{assigns: %{state: state}} = socket) do
    state =
      case value do
        "html" -> Map.put(state, :show_html, !state.show_html)
        "css" -> Map.put(state, :show_css, !state.show_css)
        "js" -> Map.put(state, :show_js, !state.show_js)
        _ -> state
      end

    {:noreply, assign(socket, state: state)}
  end

  #
  # Private Methods
  #

  defp initial_state() do
    %__MODULE__{
      html: "<p class='red'>\n  <strong>Hello, World.</strong>\n</p>",
      css: ".red {\n  color: red;\n}\n\n.blue {\n color: blue;\n}",
      js: "",
      show_html: true,
      show_css: true,
      show_js: false
    }
  end
end

