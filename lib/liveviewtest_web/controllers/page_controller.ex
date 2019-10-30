defmodule LiveviewtestWeb.PageController do
  use LiveviewtestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
