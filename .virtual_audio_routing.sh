#!/bin/sh

# Check if the sinks are not present (using grep to search the current sink list)
if ! pactl list sinks short | grep -q "DiscordSink"; then
    
    # Create modules
    # These create virtual "buckets" for your audio to sit in
    pactl load-module module-null-sink sink_name=DiscordSink
    pactl load-module module-null-sink sink_name=DesktopSink

    # Load modules
    # These loop the audio from the virtual sinks to your physical Yamaha UR12
    pactl load-module module-loopback source=DiscordSink.monitor sink=alsa_output.usb-Yamaha_Corporation_Steinberg_UR12-00.analog-stereo
    pactl load-module module-loopback source=DesktopSink.monitor sink=alsa_output.usb-Yamaha_Corporation_Steinberg_UR12-00.analog-stereo

    # Set the default sink
    # This ensures your system audio defaults to the DesktopSink
    pactl set-default-sink DesktopSink

else
    # "nothing" - The sinks already exist, so we exit quietly to avoid duplicates
    echo "Sinks are already configured."
fi
