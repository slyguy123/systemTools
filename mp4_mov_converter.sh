#!/bin/bash

# Specify the input and output directories
input_folder="/media/slyguy/SamsungSSD/shotTests/footage"
output_folder="/media/slyguy/SamsungSSD/shotTests/footage/output"

# Ensure the output directory exists
mkdir -p "$output_folder"

# Loop through each file in the input directory
for file in "$input_folder"/*; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        filename_no_ext="${filename%.*}"
        
        # Use FFmpeg to convert to uncompressed QuickTime
        ffmpeg -i "$file" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le -f mov "${output_folder}/${filename_no_ext}.mov"
        
        echo "Converted ${filename} to ${filename_no_ext}.mov"
    fi
done

echo "Conversion completed."