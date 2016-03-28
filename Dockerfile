# ubuntu erlang image is soo big, 790MB!
from erlang
# from msaraiva/erlang
copy rel/carl /code
workdir /code
expose 8080
expose 9000-9100
# entrypoint that will read env
cmd ["/code/bin/carl", "foreground"]
