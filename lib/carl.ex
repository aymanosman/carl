defmodule Carl do

  def start(_type, _args) do

    paths = [
      {"/foo", Foo, []},
      {"/resty", Resty, []},
      {"/ws", WebsocketHandler, []}
    ]

    dispatch = :cowboy_router.compile([{ :_, paths}])
    middlewares = [dispatch: dispatch]
    {:ok, _} = :cowboy.start_http(:http, # name of the http server
                                  100, # number of acceptor processes
                                  [port: 8080],
                                  [env: middlewares])
  end
end
