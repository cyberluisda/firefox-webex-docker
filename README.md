# AT THE MOMENT IS INESTABLE AND RANDOMLY CRASH

For example for request new metting. There are less probablity of breaking page
if we have development-tools enabled why?

# firefox-webex-docker

Docker image with firefox, and java 32 bits that can open webex meetings

## Build docker

```bash
docker build --tag firefox-webex:local .
```

## Run

Destroy at end without save firefox state.


```bash
xhost +"local:docker@" # Only required if was not previosly run
docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
  firefox-webex:local
```

Where

`-v /tmp/.X11-unix:/tmp/.X11-unix` mount the X11 socket
`-e DISPLAY=unix$DISPLAY` pass the display
`--device /dev/snd` sound

Without destroy docker and saving state

```bash
xhost +"local:docker@" # Only required if was not previosly run
mkdir -p /var/tmp/firefox-webex-status
docker run -it \
    -v /var/tmp/firefox-webex-status/_cache:/root/.mozilla:rw \
    -v /var/tmp/firefox-webex-status/_java:/root/.java:rw \
    -v /var/tmp/firefox-webex-status/_webex:/root/.webex:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    --name firefox-webex \
  firefox-webex:local
```

-v /var/tmp/firefox-webex-status/_mozilla:/root/.mozilla:rw

Reload previous docker state

```bash
xhost +"local:docker@" # Only required if was not previosly run
docker start firefox-webex
```

Clean status

```bash
docker rm -f firefox-webex
sudo rm -fr /var/tmp/firefox-webex-status
```
