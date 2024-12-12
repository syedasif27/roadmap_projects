#!/bin/bash
log_dir="/var/log"
backup_directory="/path/to/backup/directory"
current_date=$(date +"%Y-%m-%d")
backup_filename="log-backup-${current_date}.tar.gz"
backup_filepath="${backup_directory}/${backup_filename}"
if [ ! -d "$backup_directory" ]; then
  echo "Backup directory does not exist. Creating it now..."
  mkdir -p "$backup_directory"
fi
echo "Creating backup of logs from $log_directory..."
tar -czf "$backup_filepath" -C "$log_directory" .
if [ $? -eq 0 ]; then
  echo "Backup completed successfully: $backup_filepath"
else
  echo "Error: Backup failed!"
  exit 1
fi

