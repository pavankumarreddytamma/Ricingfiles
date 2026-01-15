#!/bin/bash
# Wait for Hyprland IPC
while [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; do
    sleep 0.5
done

exec /usr/bin/hypridle
