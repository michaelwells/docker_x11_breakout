# X11 Breakout Proof of Concept

## Background
Sometimes people suggest running GUI applications inside a Docker container by volume mounting the X11 socket. This is a really cool trick (and one I've used myself), but it definitely comes with some risks that users should be aware of. This is a quick proof of concept to show that a malicious container can do nasty things if given access to your X11 socket.

*As always, ensure you trust images before running them*

## Concept
This container attempts to find an open terminal window and uses it to get a shell on your machine. It sends a harmless command to prove the point. This is done using Jordan Sissel's excellent [xdotool](https://github.com/jordansissel/xdotool). While my example is crude and a little fragile, a more elegant example could easily be written by someone with a little knowledge of the X11 protocol.

## Instructions
Build this container locally (I do not intend to put it in the public registry)
```
docker build -t x11_breakout .
```
Run this container with the current DISPLAY variable exported to the container (-e DISPLAY)
and with the X11 unix socket mounted inside the container (-v /tmp/.X11-unix/:/tmp/.X11-unix/)
```
docker run -it -e DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix/ x11_breakout
```

# SELinux
Tools such as SELinux can mitigate risk here. In order to test this on a Fedora machine I needed to switch SELinux to permissive mode. I strongly recommend looking into the use of SELinux or similar when running Docker.
