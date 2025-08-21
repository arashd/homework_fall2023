sudo apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
sudo apt-get install build-essential swig  git

# for each of the hw directories:
pip install uv

for hw in hw1 hw2 hw3 hw4 hw5; do
cd $hw
uv venv "$hw-venv"
uv pip compile requirements.in -o requirements.txt
uv pip install -r requirements.txt
cd ..
done
