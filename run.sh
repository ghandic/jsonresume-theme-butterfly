#!/bin/bash
THEMEFOLDER=/working/theme
cd theme
npm install
while inotifywait -qqre modify "$THEMEFOLDER" --exclude "${THEMEFOLDER}/public"; do
    kill $(pidof node)
    resume serve --theme . -s &
done