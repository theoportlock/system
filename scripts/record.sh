#!/bin/bash

# Set output file name with timestamp
OUTPUT_FILE="recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is not installed. Please install it first."
    exit 1
fi

# Set video device name
VIDEO_DEVICE="/dev/video2"  # Adjust to the correct video device if necessary

# Record video using ffmpeg
ffmpeg \
    -f v4l2 \
    -framerate 10 \
    -video_size 128x72 \
    -i "$VIDEO_DEVICE" \
    -c:v libx264 \
    -preset ultrafast \
    -crf 23 \
    -movflags +faststart \
    "$OUTPUT_FILE"

# -video_size 1280x720 \
