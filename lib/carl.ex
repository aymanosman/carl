defmodule Carl do

  def start(_type, _args) do

    paths = [
      {"/foo", Foo, []},
      {"/resty", Resty, []},
      {"/ws", WebsocketHandler, []}
    ]

    dispatch = :cowboy_router.compile([{ :_, paths}])
    middlewares = [dispatch: dispatch]
    { :ok, _ } = :cowboy.start_http(:http,
                                    100,
                                    [port: 8080],
                                    [env: middlewares])
  end
end
