#!/bin/sh
pactl load-module module-null-sink sink_name=DiscordSink
pactl load-module module-null-sink sink_name=DesktopSink

pactl load-module module-loopback source=DiscordSink.monitor sink=alsa_output.usb-Yamaha_Corporation_Steinberg_UR12-00.analog-stereo
pactl load-module module-loopback source=DesktopSink.monitor sink=alsa_output.usb-Yamaha_Corporation_Steinberg_UR12-00.analog-stereo

pactl set-default-sink DesktopSink
