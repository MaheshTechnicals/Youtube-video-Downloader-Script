#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Functions to display headers and footers
header() {
    echo -e "${CYAN}====================================================${NC}"
    echo -e "${PURPLE}            YouTube Video Downloader By MT ${NC}"
    echo -e "${CYAN}====================================================${NC}"
}

footer() {
    echo -e "${CYAN}====================================================${NC}"
}

# Check and install yt-dlp and ffmpeg if not installed
check_install() {
    pkg_name=$1
    echo -e "${YELLOW}Checking for ${pkg_name}...${NC}"
    if ! command -v $pkg_name &> /dev/null; then
        echo -e "${RED}${pkg_name} not found. Installing...${NC}"
        pkg install $pkg_name -y
    else
        echo -e "${GREEN}${pkg_name} is already installed.${NC}"
    fi
}

# Start script with a stylish header
header

# Check and install necessary packages
check_install yt-dlp
check_install ffmpeg

# Ask for YouTube URL
echo -e "${CYAN}Please enter the YouTube video URL: ${NC}"
read -p "URL: " video_url

# Show available formats
echo -e "${CYAN}Fetching available formats...${NC}"
yt-dlp -F "$video_url"

# Prompt user to choose video quality
echo -e "${YELLOW}Choose video quality:${NC}"
echo -e "${BLUE}1.${NC} 1080p"
echo -e "${BLUE}2.${NC} 720p"
echo -e "${BLUE}3.${NC} 480p"
read -p "Enter the number corresponding to your desired quality (1, 2, or 3): " quality_option

# Set the format based on user input
case $quality_option in
    1) format="bestvideo[height=1080]+bestaudio[ext=m4a]/mp4"; quality="1080p" ;;
    2) format="bestvideo[height=720]+bestaudio[ext=m4a]/mp4"; quality="720p" ;;
    3) format="bestvideo[height=480]+bestaudio[ext=m4a]/mp4"; quality="480p" ;;
    *) echo -e "${RED}Invalid option. Exiting.${NC}"; footer; exit 1 ;;
esac

# Create ytbymt folder if not exists
if [ ! -d "$HOME/ytbymt" ]; then
    mkdir -p "$HOME/ytbymt"
    echo -e "${GREEN}Created ytbymt folder.${NC}"
fi

# Download the video to ytbymt folder
echo -e "${CYAN}Downloading video in ${quality} quality...${NC}"
yt-dlp -f "$format" --merge-output-format mp4 "$video_url" -o "$HOME/ytbymt/%(title)s.%(ext)s"

# Completion message
echo -e "${GREEN}Download complete!${NC}"
echo -e "${CYAN}File saved to $HOME/ytbymt${NC}"

footer
