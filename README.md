
# YouTube Video Downloader Script

This repository contains a script to download YouTube videos in MP4 format with support for Termux compatibility. The script automatically checks for required dependencies, ensures Termux storage setup, and provides an easy-to-use terminal interface for downloading YouTube videos.

## Features

- **Download YouTube videos in MP4 format**.  
- **Video Quality Options**:  
  - 720p  
  - 480p  
- **Automatic Dependency Management**:  
  - Installs `yt-dlp`, `ffmpeg`, `Python3`, and `pip3` if not already installed.  
- **Termux Storage Setup**:  
  - Automatically configures Termux storage (`termux-setup-storage`).  
- **User-Friendly Interface**:  
  - Color-coded prompts and organized outputs for a clean experience.  
- **Automatic File Handling**:  
  - Downloads are saved to a temporary folder (`ytbymt`) and automatically moved to `/sdcard/Download/`.  

## Requirements

- **Termux** installed on your Android device.  
- **Internet Connection** to download dependencies and YouTube videos.  

## Installation

1. Open Termux and clone the repository:

   \`\`\`bash
   git clone https://github.com/MaheshTechnicals/Youtube-video-Downloader-Script.git
   \`\`\`

2. Navigate to the repository directory:

   \`\`\`bash
   cd Youtube-video-Downloader-Script
   \`\`\`

3. Make the script executable:

   \`\`\`bash
   chmod +x ytmt.sh
   \`\`\`

## Usage

1. Run the script:

   \`\`\`bash
   ./ytmt.sh
   \`\`\`

2. Follow the prompts:  
   - **Enter the YouTube video URL** when prompted.  
   - Choose the desired **video quality** (720p or 480p).  

3. The video will be:  
   - Downloaded to a temporary folder (`ytbymt`).  
   - Automatically moved to the `/sdcard/Download/` directory.  

## Example Output

1. **Script Initialization**:  
   ```
   ====================================================
                YouTube Video Downloader By MT
   ====================================================
   Installing required dependencies...
   Checking Python3 installation...
   Python3 is already installed.
   Checking pip installation...
   pip3 is already installed.
   Checking yt-dlp installation...
   yt-dlp is already installed.
   Checking ffmpeg installation...
   ffmpeg is already installed.
   ```

2. **Video Download**:  
   ```
   Please enter the YouTube video URL: 
   URL: https://youtube.com/example_video

   Fetching available formats...
   Choose video quality:
   1. 720p
   2. 480p
   Enter the number corresponding to your desired quality (1 or 2): 1

   Downloading video in 720p quality...
   Moving the downloaded file to /sdcard/Download/...
   Download complete and file moved to /sdcard/Download/!
   ====================================================
   ```

## License

This script is open-source and free to use. Feel free to modify it according to your needs.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue.

## Acknowledgments

This script uses [yt-dlp](https://github.com/yt-dlp/yt-dlp), a powerful tool for downloading videos from YouTube and other platforms.  
