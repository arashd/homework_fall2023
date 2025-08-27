rsync -avn \
  --exclude='hw3/hw3-venv' --include='*/' --include='*.py' --exclude='*' \
  root@vast-qc:/root/homework_fall2023 ~/workspace/cs285/