# ubuntu erlang image is soo big, 790MB!
from erlang
# from msaraiva/erlang
copy rel/carl /code
copy kube/entrypoint.sh /entrypoint-kubernetes.sh
run chmod +x /entrypoint-kubernetes.sh
workdir /code
expose 8080
expose 9000-9100
# entrypoint that will read env for $MY_POD_IP
# starting erl with -name carl@$MY_POD_IP
entrypoint ["/entrypoint-kubernetes.sh"]
cmd ["/bin/carl", "foreground"]
