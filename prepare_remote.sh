sudo apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
sudo apt-get install build-essential swig  git

# for each of the hw directories:
pip install uv

cd "hw3"
yes n | uv venv "hw3-venv"
source "hw3-venv/bin/activate"
uv pip compile requirements.in -o requirements.txt
uv pip install -r requirements.txt
cd ..

