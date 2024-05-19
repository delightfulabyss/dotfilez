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

# Backup files
echo "Backing up files..."
borgmatic create --verbosity 1 --list --stats
echo "Backup complete!"

# Resume swayidle
if [[ "$PROCSTATE" == *"T"* ]]; then
  echo "Resuming swayidle..."
	kill -CONT $PID
fi

