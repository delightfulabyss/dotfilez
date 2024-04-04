#!/usr/bin/env zsh

# Get swayidle PID
PID=$(ps -ef | rg 'swayidle' | rg --invert-match 'rg' | awk '{print $2}')

# Pause swayidle if running
if [[ -n $PID ]]; then
	echo "Pausing swayidle..."
	kill -STOP $PID
fi

# Get swayidle state
PROCSTATE=$(ps aux | rg 'swayidle' | rg --invert-match 'rg' | awk '{print $8}')

# Turn on vpn
echo "Starting VPN connection..."
wg-quick "up" "Laptop"

# Backup files
echo "Backing up files..."
rsync -aAXhHv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} "/" "pi@192.168.1.30:/media/pi/extdrive/backups"
echo "Backup complete!"

# Turn off vpn
echo "Shutting down VPN connection..."
wg-quick "down" "Laptop"

# Resume swayidle
if [[ "$PROCSTATE" == *"T"* ]]; then
  echo "Resuming swayidle..."
	kill -CONT $PID
fi

