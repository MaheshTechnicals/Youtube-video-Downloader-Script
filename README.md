
# YouTube Video Downloader Script

This script allows you to download YouTube videos in various quality options (including 2160p, 1440p, 1080p, 720p, and 480p) using `yt-dlp`. It provides a user-friendly terminal interface with color-coded prompts and messages.

## Features

- Download YouTube videos in MP4 format.
- Quality options:
  - 2160p (4K)
  - 1440p
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

1. Open Termux and create a new script file:

   ```bash
   nano ytdownloader.sh
   ```

2. Copy and paste the script code into the file. (Refer to the script provided above)

3. Save and exit the file by pressing `Ctrl + X`, then `Y`, and `Enter`.

4. Make the script executable:

   ```bash
   chmod +x ytdownloader.sh
   ```

## Usage

1. Run the script:

   ```bash
   ./ytdownloader.sh
   ```

2. Follow the prompts:
   - Enter the YouTube video URL when prompted.
   - Choose the desired video quality by entering the corresponding number (1-5).

3. The video will be downloaded to the `ytbymt` folder in your home directory.

## License

This script is open-source and free to use. Feel free to modify it according to your needs.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue.

## Acknowledgments

This script uses `yt-dlp`, a powerful command-line tool for downloading videos from YouTube and other platforms. Visit [yt-dlp GitHub](https://github.com/yt-dlp/yt-dlp) for more information.
