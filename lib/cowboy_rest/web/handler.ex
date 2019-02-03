defmodule CowboyRest.Web.Handler do
  use Plug.Router
  require Logger

  plug(:match)
  plug(:dispatch)

  @content_type_header_key "content-type"
  @html_header_value "text/html"
  @entrypoint "/cowboy_rest/"

  get @entrypoint <> "/welcome" do
    # populates conn.params
    Plug.Conn.fetch_query_params(conn)
    |> put_resp_header(@content_type_header_key, @html_header_value)
    |> send_resp(200, "Welcome to Cowboy Rest Services")
  end
end
