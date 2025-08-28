#!/usr/bin/env bash
# tb_rsync.sh
# Usage: ./tb_rsync.sh <remote_host> <remote_logdir>
# Example: ./tb_rsync.sh myuser@remote.server.com /home/myuser/runs/exp42

REMOTE_HOST=$1
REMOTE_LOGDIR=$2
LOCAL_DIR=$(mktemp -d -t tb_rsync.XXXXXX)

echo "Mirroring ${REMOTE_HOST}:${REMOTE_LOGDIR} → $LOCAL_DIR"
echo "TensorBoard available at http://localhost:6006"

# start sync loop in background
(
  while true; do
    rsync -az --delete "${REMOTE_HOST}:${REMOTE_LOGDIR}/" "$LOCAL_DIR"/
    sleep 5
  done
) &
SYNC_PID=$!

# ensure background loop is killed when script exits (Ctrl-C etc.)
cleanup() {
  kill $SYNC_PID 2>/dev/null
}
trap cleanup EXIT

# run tensorboard on default port (6006)
tensorboard --logdir "$LOCAL_DIR"