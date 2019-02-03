defmodule CowboyRest.Web.Supervisor do
  @moduledoc false
  use Supervisor

  def start_link(_arg, _opts) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker(CowboyRest.Web.HttpListener, [[], []])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
