rsync -avn \
  --exclude='hw2/hw2-venv' --exclude='hw3/hw3-venv' --include='*/' --include='*.py' --exclude='*' \
  root@vast-nj:/root/homework_fall2023/homework_fall2023/ ~/workspace/cs285/homework_fall2023/