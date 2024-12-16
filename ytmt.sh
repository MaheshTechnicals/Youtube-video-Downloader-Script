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

# Install required dependencies
install_dependencies() {
    echo -e "${YELLOW}Installing required dependencies...${NC}"
    # Update package manager
    echo -e "${BLUE}Updating package manager...${NC}"
    apt update && apt upgrade -y

    # Install Python3 and pip if not already installed
    echo -e "${BLUE}Checking Python3 installation...${NC}"
    if ! command -v python3 &> /dev/null; then
        echo -e "${RED}Python3 not found. Installing...${NC}"
        apt install python3 -y
    else
        echo -e "${GREEN}Python3 is already installed.${NC}"
    fi

    echo -e "${BLUE}Checking pip installation...${NC}"
    if ! command -v pip3 &> /dev/null; then
        echo -e "${RED}pip3 not found. Installing...${NC}"
        apt install python3-pip -y
    else
        echo -e "${GREEN}pip3 is already installed.${NC}"
    fi

    # Install yt-dlp using pip
    echo -e "${BLUE}Checking yt-dlp installation...${NC}"
    if ! pip3 show yt-dlp &> /dev/null; then
        echo -e "${RED}yt-dlp not found. Installing using pip...${NC}"
        pip3 install -U yt-dlp
    else
        echo -e "${GREEN}yt-dlp is already installed.${NC}"
    fi

    # Install ffmpeg
    echo -e "${BLUE}Checking ffmpeg installation...${NC}"
    if ! command -v ffmpeg &> /dev/null; then
        echo -e "${RED}ffmpeg not found. Installing...${NC}"
        apt install ffmpeg -y
    else
        echo -e "${GREEN}ffmpeg is already installed.${NC}"
    fi
}

# Start script with a stylish header
header

# Install all required dependencies
install_dependencies

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
    1) format_video="bestvideo[height=1080]"; quality="1080p" ;;
    2) format_video="bestvideo[height=720]"; quality="720p" ;;
    3) format_video="bestvideo[height=480]"; quality="480p" ;;
    *) echo -e "${RED}Invalid option. Exiting.${NC}"; footer; exit 1 ;;
esac

# Set audio format
format_audio="bestaudio"

# Create ytbymt folder if not exists
if [ ! -d "$HOME/ytbymt" ]; then
    mkdir -p "$HOME/ytbymt"
    echo -e "${GREEN}Created ytbymt folder.${NC}"
fi

# Download video and audio separately, then merge them
output_path="$HOME/ytbymt/%(title)s.%(ext)s"
echo -e "${CYAN}Downloading video in ${quality} quality...${NC}"
yt-dlp -f "$format_video+$format_audio" --merge-output-format mp4 "$video_url" -o "$output_path"

# Check if the download was successful
if [ $? -eq 0 ]; then
    # Move the downloaded file to /sdcard/Download/
    echo -e "${CYAN}Moving the downloaded file to /sdcard/Download/...${NC}"
    mv "$HOME/ytbymt/"* /sdcard/Download/

    # Completion message
    echo -e "${GREEN}Download complete and file moved to /sdcard/Download/!${NC}"
else
    echo -e "${RED}Download failed. Please try again.${NC}"
fi

footer
