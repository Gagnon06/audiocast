# audiocast

Docker image based on rust:debian for audio casting.

Using : 
- [snapcast](https://github.com/badaix/snapcast)
- [librespot](https://github.com/librespot-org/librespot)
- [mopidy](https://github.com/mopidy/mopidy)
- [mopidy-mpd](https://github.com/mopidy/mopidy-mpd)
- [mopidy-spotify](https://github.com/mopidy/mopidy-spotify)
- [mopidy-musicbox-webclient](https://github.com/pimusicbox/mopidy-musicbox-webclient)

## Quickstart

### Build

```bash
docker build -t audiocast:latest .
```

### Docker compose example

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
