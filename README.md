# Trans2x265

This is a bash script that transcodes video files in a given directory to the x265 (HEVC) format using the HandBrakeCLI tool. It supports a range of file extensions such as avi, mov, mkv, mpg, flv, webm, mp4, m4v, asf, ts, m2ts, mts, and vob. After transcoding, the original file is removed, and the new file is moved back to the source directory.

The script first sets up some color codes for printing messages to the console. It then checks if HandBrakeCLI is installed and installs it if necessary. The user is then prompted to enter the directory containing the files to be transcoded. The script then loops through all the files in the directory, transcoding them to x265, and replacing the original file with the transcoded file. Finally, the script prints a success message and closes.
