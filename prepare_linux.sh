sudo apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
sudo apt-get install build-essential swig  git

pip install uv
uv pip compile requirements.in -o requirements.txt
uv pip install -r requirements.txt

