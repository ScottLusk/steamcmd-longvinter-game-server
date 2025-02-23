[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/hoeney/steamcmd-longvinter-game-server)](https://hub.docker.com/repository/docker/hoeney/steamcmd-longvinter-game-server)
### steamcmd-longvinter-game-server
A Longvinter Game Server based on SteamCMD
https://www.longvinter.com/

## Ports 
- `7777 UDP`
  - Longvinter game port
- `27016 TCP/UDP`
  - Query port
  
## Volumes
- /home/steam/longvinter-dedicated-server/data
  - Mount this volume to persist the server game files storage

## Updates
Restarting the docker container will update the game server automatically through Steam.

## Server Configuration
Please follow the guide from the Longvinter development team
https://wiki.longvinter.com/server/configuration
