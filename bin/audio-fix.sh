## reset audio to connect to blue tooth
## This is sometime required when undocking the laptop
##
pulseaudio --kill
# pulseaudio --stop 
pulseaudio --cleanup-shm
pulseaudio --start
echo "pulseaudio reset completed. Is it working?"
