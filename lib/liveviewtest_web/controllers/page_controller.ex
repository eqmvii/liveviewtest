defmodule LiveviewtestWeb.PageController do
  use LiveviewtestWeb, :controller
  import Phoenix.LiveView.Controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def counterdemo(conn, _params) do
    render(conn, "counterdemo.html")
  end

  def formdemo(conn, _params) do
    render(conn, "formdemo.html")
  end

def live(conn, _params) do
    live_render(conn, LiveviewtestWeb.ThermostatLive, session: %{
      id: 1,
      current_user_id: 44, # not really sure what these are useful for yet, random demo values used here
    })
  end
end
