# audiocast

Docker image based on rust:debian for audio casting.

Using : 
- snapcast
- librespot
- mopidy

## Quickstart

docker-compose.yml example : 
```yaml
version: '3'

services:
    audiocast:
        image: audiocast:latest
        volumes:
          - ./config/audiocast:/root/.config:rw
        environment:
          - TZ="America/Toronto"
        restart: unless-stopped
        ports:
          - 6600:6600 # MPD
          - 6680:6680 # Mopidy HTTP
          - 1704:1704 # Snapserver
          - 1705:1705 # Snapserver
          - 1780:1780 # Snapserver Web GUI
```
