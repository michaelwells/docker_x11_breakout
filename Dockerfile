#
# A demonstration of what a container can do with access to our X11 socket
#
# Need to run with the current DISPLAY variable exported to the container (-e DISPLAY)
# Need to run with the X11 unix socket mounted inside the container (-v /tmp/.X11-unix/:/tmp/.X11-unix/)
#
# docker run -it -e DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix/
#
################################################################################################################

FROM fedora:22
MAINTAINER Mike

RUN dnf install -y xdotool

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
