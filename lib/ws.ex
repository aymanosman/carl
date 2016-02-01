defmodule WebsocketHandler do
  @behaviour :cowboy_websocket_handler

  def init({tcp, http}, _req, _opts) do
    {:upgrade, :protocol, :cowboy_websocket}
  end

  def websocket_init(_TransportName, req, _opts) do
    IO.puts "init.  Starting timer. PID is #{inspect(self())}"

    tref = :erlang.start_timer(1000, self(), [])
    {:ok, req, tref}
  end

  def websocket_terminate(_reason, _req, _state) do
    :ok
  end

  def websocket_handle({:text, content}, req, state) do
    { :ok, %{ "message" => message} } = JSEX.decode(content)

    rev = String.reverse(message)
    { :ok, reply } = JSEX.encode(%{ reply: rev})

    {:reply, {:text, reply}, req, state}
  end

  # fallback message handler
  def websocket_handle(frame, req, state) do
    IO.puts "Received a frame I could not handle #{inspect(frame)}"
    {:ok, req, state}
  end

  def websocket_info({:timeout, _ref, _foo}, req, state) do
    time = time_as_string()

    { :ok, message } = JSEX.encode(%{time: time})
    :erlang.start_timer(1000, self(), [])

    { :reply, {:text, message}, req, state}
  end

  # fallback message handler
  def websocket_info(info, req, state) do
    IO.puts "Received erlang message I could not handle #{inspect(info)}"
    {:ok, req, state}
  end

  def time_as_string do
    {hh,mm,ss} = :erlang.time()
    :io_lib.format("~2.10.0B:~2.10.0B:~2.10.0B",[hh,mm,ss])
      |> :erlang.list_to_binary()
  end

end
