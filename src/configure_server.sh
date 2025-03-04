#!/bin/bash

# Config vars
DATA_DIR="$STEAMAPPDIR"
SERVER_CONFIG_PATH="Longvinter/Saved/Config/LinuxServer/Game.ini"

# Default server settings (do not edit these, use environment variables to override)
DEFAULT_CFG_SERVER_NAME="Unnamed Island"
DEFAULT_CFG_MAX_PLAYERS=32
DEFAULT_CFG_SERVER_MOTD="Welcome to Longvinter Island!"
DEFAULT_CFG_PASSWORD=""
DEFAULT_CFG_COMMUNITY_WEBSITE="www.longvinter.com"
DEFAULT_CFG_ADMIN_STEAM_ID=""
DEFAULT_CFG_ENABLE_PVP="true"
DEFAULT_CFG_TENT_DECAY="true"
DEFAULT_CFG_MAX_TENTS=2
DEFAULT_CFG_GAME_PORT=7777
DEFAULT_CFG_QUERY_PORT=27016
DEFAULT_CFG_COOP_PLAY="false"

# Check if script was ran from data directory (see DATA_DIR variable above)
if [ $PWD != $DATA_DIR ]; then
    echo "Current directory not $DATA_DIR, changing into $DATA_DIR..."
    cd $DATA_DIR
fi

CONFIG_FILE_FULL_PATH="$DATA_DIR/$SERVER_CONFIG_PATH"

if [ ! -e "$CONFIG_FILE_FULL_PATH" ]; then
    echo "Server config file missing, creating it..."
    touch $CONFIG_FILE_FULL_PATH
fi

echo "Preparing config variables..."
# Check if default config was overridden for one or more settings. If not use the defaults above.
if [ -z "$CFG_SERVER_NAME" ]; then CFG_SERVER_NAME=$DEFAULT_CFG_SERVER_NAME; fi
if [ -z "$CFG_MAX_PLAYERS" ]; then CFG_MAX_PLAYERS=$DEFAULT_CFG_MAX_PLAYERS; fi
if [ -z "$CFG_SERVER_MOTD" ]; then CFG_SERVER_MOTD=$DEFAULT_CFG_SERVER_MOTD; fi
if [ -z "$CFG_PASSWORD" ]; then CFG_PASSWORD=$DEFAULT_CFG_PASSWORD; fi
if [ -z "$CFG_COMMUNITY_WEBSITE" ]; then CFG_COMMUNITY_WEBSITE=$DEFAULT_CFG_COMMUNITY_WEBSITE; fi
if [ -z "$CFG_ADMIN_STEAM_ID" ]; then CFG_ADMIN_STEAM_ID=$DEFAULT_CFG_ADMIN_STEAM_ID; fi
if [ -z "$CFG_ENABLE_PVP" ]; then CFG_ENABLE_PVP=$DEFAULT_CFG_ENABLE_PVP; fi
if [ -z "$CFG_TENT_DECAY" ]; then CFG_TENT_DECAY=$DEFAULT_CFG_TENT_DECAY; fi
if [ -z "$CFG_MAX_TENTS" ]; then CFG_MAX_TENTS=$DEFAULT_CFG_MAX_TENTS; fi
if [ -z "$CFG_GAME_PORT" ]; then CFG_GAME_PORT=$DEFAULT_CFG_GAME_PORT; fi
if [ -z "$CFG_QUERY_PORT" ]; then CFG_QUERY_PORT=$DEFAULT_CFG_QUERY_PORT; fi
if [ -z "$CFG_COOP_PLAY" ]; then CFG_COOP_PLAY=$DEFAULT_CFG_COOP_PLAY; fi

echo "Setting config variables..."
# Creating the Game.ini file line for line.
# Note that the line directly below this one overwrites the file and its contents (using a single > instead of >>).
echo "[/Game/Blueprints/Server/GI_AdvancedSessions.GI_AdvancedSessions_C]" > $CONFIG_FILE_FULL_PATH
echo "ServerName=$CFG_SERVER_NAME" >> $CONFIG_FILE_FULL_PATH
echo "MaxPlayers=$CFG_MAX_PLAYERS" >> $CONFIG_FILE_FULL_PATH
echo "ServerMOTD=$CFG_SERVER_MOTD" >> $CONFIG_FILE_FULL_PATH
echo "Password=$CFG_PASSWORD" >> $CONFIG_FILE_FULL_PATH
echo "CommunityWebsite=$CFG_COMMUNITY_WEBSITE" >> $CONFIG_FILE_FULL_PATH
echo "[/Game/Blueprints/Server/GM_Longvinter.GM_Longvinter_C]" >> $CONFIG_FILE_FULL_PATH
echo "AdminSteamID=$CFG_ADMIN_STEAM_ID" >> $CONFIG_FILE_FULL_PATH
echo "PVP=$CFG_ENABLE_PVP" >> $CONFIG_FILE_FULL_PATH
echo "TentDecay=$CFG_TENT_DECAY" >> $CONFIG_FILE_FULL_PATH
echo "MaxTents=$CFG_MAX_TENTS" >> $CONFIG_FILE_FULL_PATH
echo "CoopPlay=$CFG_COOP_PLAY" >> $CONFIG_FILE_FULL_PATH
