#!/usr/bin/env bash
set -e

# Only source if file exists
if [ -f /aosp/build/envsetup.sh ]; then
  echo "Sourcing envsetup.sh"
  source /aosp/build/envsetup.sh
fi

if [ -f /aosp/.envrc ]; then
  echo "Sourcing .envrc"
  source /aosp/.envrc
fi

# Default to 'bash' if no arguments are provided
args="$@"
if [ -z "$args" ]; then
  args="bash"
fi

exec $args
