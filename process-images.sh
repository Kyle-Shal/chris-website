#!/bin/sh

THUMB_OUT_DIR="./public/assets/auto-thumbnails"
LARGE_OUT_DIR="./public/assets/auto-large"

mkdir -p "$THUMB_OUT_DIR"
mkdir -p "$LARGE_OUT_DIR"

for FILE in ./public/assets/drawings/*;
do
    echo $FILE;
    FILE_NAME=$(basename "$FILE" .png)

    convert "$FILE" -define jpeg:size=400x400 -thumbnail 400x400^ -gravity center -extent 400x400 -quality 70% "$THUMB_OUT_DIR/$FILE_NAME.jpg"
    convert "$FILE" -resize 1200x1200 "$LARGE_OUT_DIR/$FILE_NAME.png"
done
