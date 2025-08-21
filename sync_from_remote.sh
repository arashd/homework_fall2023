rsync -avn \
  --exclude='hw2/hw2-venv' --include='*/' --include='*.py' --exclude='*' \
  root@vast:/root/homework_fall2023/homework_fall2023/ ~/workspace/cs285/homework_fall2023/