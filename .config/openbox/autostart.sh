# wallpaper
nitrogen --restore & 

# panel
tint2 &

# composting
compton &

# 2x2 worspace layout
/home/colin/bin/setlayout 0 2 2 0 &

# sound daemon
pulseaudio --start &

# volume icon
(sleep 3 && volumeicon) &

# clipboard
(sleep 3 && parcellite) &

# file namager
thunar --daemon &

# screensaver
xscreensaver --no-splash &

# synergy client
synergy &

# gkrellm monitor
gkrellm &
