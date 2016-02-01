defmodule Carl do

  def start(_type, _args) do

    paths = [
      {"/foo", Foo, []},
      {"/ws", WebsocketHandler, []}
    ]

    dispatch = :cowboy_router.compile([{ :_, paths}])
    { :ok, _ } = :cowboy.start_http(:http,
                                    100,
                                    [port: 8080],
                                    [{ :env, [dispatch: dispatch]}]
    )
  end
end
