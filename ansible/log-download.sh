#!/bin/bash

set -ex

LOG_DIR="/var/logs/bench-logs"
mkdir -p "$LOG_DIR"

declare -A files=(
  ["Apache.tar.gz"]="https://zenodo.org/record/3227177/files/Apache.tar.gz?download=1"
  ["HDFS_1.tar.gz"]="https://zenodo.org/record/3227177/files/HDFS_2.tar.gz?download=1"
  ["Linux.tar.gz"]="https://zenodo.org/record/3227177/files/Linux.tar.gz?download=1"
  ["Thunderbird.tar.gz"]="https://zenodo.org/record/3227177/files/Thunderbird.tar.gz?download=1"
  ["SSH.tar.gz"]="https://zenodo.org/record/3227177/files/SSH.tar.gz?download=1"
)

for file in "${!files[@]}"; do
  if [ ! -f "$LOG_DIR/$file" ]; then
    wget -O "$LOG_DIR/$file" "${files[$file]}"
  fi
done

for file in "$LOG_DIR"/*.tar.gz; do
  tar -xvf "$file" -C "$LOG_DIR"
done