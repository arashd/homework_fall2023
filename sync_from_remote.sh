# take two arguments: the hw number (1, 2, 3) and the remote name, then use rsync to sync the files from the remote machine to the local machine

# check if the arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <hw_number> <remote_name>"
    exit 1
fi

# sync the files

rsync -avv --progress \
  --exclude='hw3/hw3-venv' --include='*.py' --exclude='*.pyc' --exclude='*/requirements.txt' \
  $2:/root/homework_fall2023/hw$1 ~/workspace/cs285/homework_fall2023/