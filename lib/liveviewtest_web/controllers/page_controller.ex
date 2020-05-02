defmodule LiveviewtestWeb.PageController do
  use LiveviewtestWeb, :controller
  import Phoenix.LiveView.Controller

  def index(conn, _params) do

    # Testing Redix connection by randomly setting/getting on page load
    IO.puts "\n\n"
    Redix.command(:redix, ["SET", "testkey", "testval"])
    IO.inspect Redix.command(:redix, ["GET", "testkey"]) # name redix given when the child process was started
    IO.puts "\n"

    render(conn, "index.html")
  end

  def counterdemo(conn, _params) do
    render(conn, "counterdemo.html")
  end

  def formdemo(conn, _params) do
    render(conn, "formdemo.html")
  end

def livetest(conn, _params) do
    live_render(conn, LiveviewtestWeb.ThermostatLive, session: %{
      id: 1,
      current_user_id: 44, # not really sure what these are useful for yet, random demo values used here
    })
  end
end
