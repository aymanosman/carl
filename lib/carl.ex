defmodule Carl do

  def start(_type, _args) do

    paths = [
      {"/", Foo, []},
      {"/resty", Resty, []},
      {"/ws", WebsocketHandler, []}
    ]

    dispatch = :cowboy_router.compile([{ :_, paths}])
    # This is slightly awkward to construct
    middlewares = [
      :cowboy_router,
      MyMiddleware,
      :cowboy_handler
    ]

    port = Application.get_env(:carl, :port)
    IO.puts "Will bind to PORT #{port}"

    {:ok, _} = :cowboy.start_http(:http, # name of the http server
                                  100, # number of acceptor processes
                                  [port: port],
                                  [env: [dispatch: dispatch],
                                   middlewares: middlewares])
  end
end
