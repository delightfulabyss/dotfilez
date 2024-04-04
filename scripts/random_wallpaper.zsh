#!/usr/bin/env zsh

# Set the directory where your images are located
image_dir="$HOME/Pictures/Wallpapers"

# Change to the image directory
cd "$image_dir" || exit

# Get a list of all image files in the directory
image_files=("${image_dir}"/*.(jpg|jpeg|png|gif))

# Check if there are any image files
if (( ${#image_files} == 0 )); then
    echo "No image files found in $image_dir"
    exit 1
fi

# Pick a random image file
random_index=$((RANDOM % ${#image_files}))
random_image="${image_files[$random_index]}"

# Set the random image as the desktop background using swww
swww img "$random_image"

# Copy current image to image in cache called "curremt_wallpaper"
cp "$random_image" "$HOME/.cache/current_wallpaper.jpg"
