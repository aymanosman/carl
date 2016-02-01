defmodule Foo do

  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(req, state) do
    {:ok, reply} = :cowboy_req.reply(
      200,
      [{"content-type", "text/html"}],
      # "<h1>Hello Erlang</h1>",
      build_body(req),
      req)

    {:ok, reply, state}
  end

  def terminate(reason, req, state) do
    :ok
  end

  def build_body(request) do
  """
  <html>
  <body>
    <div id='main'>

    <h2>Current Time (:erlang.now)</h2>
    <p><span class='time'> #{inspect(:erlang.timestamp)}</span></p>
    <p>Reload this page to see the time change.</p>
    <h2>Your Request Headers</h2>
    <dl>#{dl_headers(request)}</dl>
    </div>
  </body>

  <script>
    var ws = new WebSocket('ws://localhost:8080/ws');
    ws.onmessage = function(e) { console.log(e.data); };
  </script>
  </html>
  """
  end

  def dl_headers(request) do
    {headers, req2 } = :cowboy_req.headers(request)
    Enum.map(headers,
      fn item -> "<dt>#{elem(item, 0)}</dt><dd>#{elem(item, 1)}</dd>" end)
  end
end
