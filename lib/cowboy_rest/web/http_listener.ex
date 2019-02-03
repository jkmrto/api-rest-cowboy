defmodule CowboyRest.Web.HttpListener do
  alias CowboyRest.Web.Handler
  alias Plug.Cowboy
  require Logger

  def start_link(_state, _opts) do
    Logger.info("API Rest is working ...")

    options = [
      port: 4000,
      dispatch: [{host(), routes()}]
    ]

    Cowboy.http(__MODULE__, [], options)
  end

  def host(), do: :_

  def routes() do
    [
      {"/cowboy_rest/[...]", Cowboy.Handler, {Handler, []}}
    ]
  end
end
