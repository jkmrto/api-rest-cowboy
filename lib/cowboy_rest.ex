defmodule CowboyRest do
  use Application

  def start(_type, _args) do
    children = [
      Supervisor.Spec.supervisor(CowboyRest.Web.Supervisor, [[], []])
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
