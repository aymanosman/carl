# ubuntu erlang image is soo big, 790MB!
from erlang
# from msaraiva/erlang
copy rel/carl /code
workdir /code
expose 8080
cmd ["/code/bin/carl", "foreground"]
