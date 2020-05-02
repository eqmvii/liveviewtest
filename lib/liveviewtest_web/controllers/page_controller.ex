defmodule LiveviewtestWeb.PageController do
  use LiveviewtestWeb, :controller
  import Phoenix.LiveView.Controller

  def index(conn, _params) do

    # redis page view counter proof-of-concept
    IO.puts "\n\n"
    case Redix.command(:redix, ["EXISTS", "pageviews"]) do
      {:ok, 0} -> Redix.command(:redix, ["SET", "pageviews", 1])
      {:ok, 1} -> Redix.command(:redix, ["INCR", "pageviews"])
    end

    IO.inspect Redix.command(:redix, ["GET", "pageviews"])
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
