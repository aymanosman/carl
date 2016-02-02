defmodule Resty do
  @behaviour :cowboy_websocket_handler

	def init(req, opts) do
    {:cowboy_rest, req, opts}
  end

  def handle(req, state) do
    {:ok, reply} = :cowboy_req.reply(
      200,
      [{"content-type", "text/html"}],
      "<h1>Hello Erlang</h1>",
      req)
    {:ok, reply, state}
  end
end
