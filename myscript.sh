#!/bin/bash

echo "Listening ..."

arecord -f S16_LE -D plughw:1,0 -d 3 -r 44100 Record.wav


echo "Sending Google Speech Recognition..."
curl -X POST  --data-binary @'Record.wav' --header 'Content-Type: audio/l16; rate=44100;' 'https://www.google.com/speech-api/v2/recognize?output=json&lang=en-US&key=YOUR_KEY'>Response.txt

echo -n "Result ..."

cat Response.txt
