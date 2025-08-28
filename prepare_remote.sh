# take two arguments: the hw number (1, 2, 3) and the remote name, then do the pip compile and install there.

# check if the arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <hw_number> <remote_name>"
    exit 1
fi

# install uv
pip install uv

# install dependencies
sudo apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
sudo apt-get install build-essential swig  git

# for each of the hw directories:
cd "hw$1"
rm -rf "hw$1-venv"
uv venv "hw$1-venv"
source "hw$1-venv/bin/activate"
uv pip compile requirements.in -o requirements.txt
uv pip install -r requirements.txt
source "hw$1-venv/bin/activate"
