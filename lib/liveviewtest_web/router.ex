defmodule LiveviewtestWeb.Router do
  use LiveviewtestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveviewtestWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/livetest", PageController, :livetest
    get "/counterdemo", PageController, :counterdemo
    get "/formdemo", PageController, :formdemo
  end

  scope "/", LiveviewtestWeb do
    live "/thermostat", ThermostatLive, session: [:user_id] # remove user_id?
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveviewtestWeb do
  #   pipe_through :api
  # end
end
