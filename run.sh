if [ -z "$(ps -ef|grep XQuartz|grep -v grep)" ] ; then
    open -a XQuartz
fi
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
echo "My IP is: $ip"
xhost + ${ip}
docker run -it --rm -e DISPLAY=${ip}:0 -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 -v $PWD/pt:/root/pt packet-tracer:7.2
