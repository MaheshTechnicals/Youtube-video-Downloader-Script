
# YouTube Video Downloader Script

This repository contains a script to download YouTube videos in various quality options (including 2160p, 1440p, 1080p, 720p, and 480p) using `yt-dlp`. The script features a user-friendly terminal interface with color-coded prompts and messages.

## Features

- Download YouTube videos in MP4 format.
- Qality options:

  - 1080p
  - 720p
  - 480p
- Automatically checks for and installs required packages (`yt-dlp` and `ffmpeg`).
- Saves downloaded videos to a dedicated folder (`ytbymt`).
- User-friendly and visually appealing terminal interface.

## Requirements

- Termux installed on your Android device.
- Internet connection to download the script and YouTube videos.

## Installation

1. Open Termux and clone the repository:

   ```bash
   git clone https://github.com/MaheshTechnicals/Youtube-video-Downloader-Script.git
   ```

2. Navigate to the repository directory:

   ```bash
   cd Youtube-video-Downloader-Script
   ```

3. Make the script executable:

   ```bash
   chmod +x ytmt.sh
   ```

## Usage

1. Run the script:

   ```bash
   ./ytmt.sh
   ```

2. Follow the prompts:
   - Enter the YouTube video URL when prompted.
   - Choose the desired video quality by entering the corresponding number (1-3).

3. The video will be downloaded to the `ytbymt` folder in your home directory.

## License

This script is open-source and free to use. Feel free to modify it according to your needs.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue.

## Acknowledgments

This script uses `yt-dlp`, a powerful command-line tool for downloading videos from YouTube and other platforms. Visit [yt-dlp GitHub](https://github.com/yt-dlp/yt-dlp) for more information.
