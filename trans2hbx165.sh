
#!/bin/bash

##########################
##########################
### Scripted by RkDsNz ###
###  rkdsnz@rdnsx.de   ###
##########################
##########################

# Reset
NC='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

#SRC="$SRCDIR"
DEST="/tmp"
DEST_EXT=mp4
HANDBRAKE_CLI=HandBrakeCLI
PRESET="x265"

echo
echo
echo -e "                     ${Red}================================${NC}"
echo -e "                     ${Cyan}       Welcome to RDNSX265${NC}"
echo -e "                     ${Red}================================${NC}"
echo
echo "    This script will transcode and replace all codecs and avi,mov,mkv,mpg,"
echo "       flv,webm,mp4,m4v,asf,ts,m2ts,mts,vob file/s to x265 (HEVC) .mp4"
echo "                by using HandbrakeCLI. https://handbrake.fr/"
echo
echo -e "                             Scipted by ${UCyan}RkDsNz"
echo
echo
sleep 2

REQUIRED_PKG="handbrake-cli"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG)
if [ "" = "$PKG_OK" ]; then
  echo -e $REQUIRED_PKG ${Red}is not installed${NC}.
  echo
  echo -e "${Green}Installing $REQUIRED_PKG now.${NC}"
  echo
  sudo apt-get install $REQUIRED_PKG -y
else
echo -e $REQUIRED_PKG ${Green}is installed${NC}!
fi

echo
echo -e "${UCyan}Please enter the directory to be processed:${NC}"
read SRCDIR
echo
echo -e "The directory was set to: ${Cyan}$SRCDIR${NC}!"
sleep 2
echo
echo
echo "Transcoding is starting..."
echo -e "${Green}==========================${NC}"
echo
sleep 3

for FILE in "$SRCDIR"/*.{avi,mov,mkv,mpg,flv,webm,mp4,m4v,asf,ts,m2ts,mts,vob}
do
filename=$(basename "$FILE")
extension=${filename##*.}
filename=${filename%.*}

$HANDBRAKE_CLI -i "$FILE" -o "$DEST"/"$filename".$DEST_EXT -e "$PRESET"

if [ -e "$DEST"/"$filename".$DEST_EXT ];then
        rm "$FILE"
        mv "$DEST"/"$filename".$DEST_EXT "$SRCDIR"
        echo
        echo -e "${Green}====================================${NC}"
        echo -e "${filename}.${extension} was replaced successfully!"
        echo -e "${Green}====================================${NC}"
        echo
else
        echo
        echo -e "${Red}====================================${NC}"
        echo -e "No .${extension} files to transcode!"
        echo -e "${Red}====================================${NC}"
        echo
fi

done

        echo
        echo -e "${Green}====================================${NC}"
        echo "            Successfull!"
        echo -e "${Green}====================================${NC}"
        echo
        sleep 1
        echo -e "Closing ${Cyan}RDNSX265...${NC}"
        echo
        sleep 3
