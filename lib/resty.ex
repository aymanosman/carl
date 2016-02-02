defmodule Resty do

	def init({:tcp, :http}, _req, _opts) do
    {:upgrade, :protocol, :cowboy_rest}
  end

  def content_types_provided(req, state) do
    IO.puts "lol wut"
    # mappings = [
    #   {"application/json", &aaa_to_json/2}
    # ]
    mappings = [
      {{<<"text">>, <<"html">>, '*'}, &to_html/2}
    ]
    {mappings, req, state}
  end

  def to_html(req, state) do
    {"<h1>lol</h1>", req, state}
  end

  def aaa_to_json(req, state) do
    body = """
    {"rest": "Hello Cowboy!"}
    """
    {body, req, state}
  end

end
