# ubuntu erlang image is soo big, 790MB!
from erlang
# from msaraiva/erlang
copy rel /rel
expose 8080
cmd ["/rel/carl/bin/carl", "foreground"]
