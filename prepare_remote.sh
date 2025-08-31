# take a single argument: the hw number (1, 2, 3), then do the pip compile and install there.

# check if the arguments are provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <hw_number>" 
    exit 1
fi

# install uv
pip install uv

# install dependencies
sudo apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
sudo apt-get install build-essential swig  git
sudo apt-get install -y libgl1 libegl1 -y

# for each of the hw directories:
cd "hw$1"
rm -rf "hw$1-venv"
uv venv "hw$1-venv"
source "hw$1-venv/bin/activate"
uv pip compile requirements.in -o requirements.txt
uv pip install -r requirements.txt
source "hw$1-venv/bin/activate"

# export MUJOCO_GL="egl"