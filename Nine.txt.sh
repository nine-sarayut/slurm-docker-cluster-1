
ssh-keygen -t ed25519 -C "s.winuthayanon@missouri.edu"
git --version
git config --global user.name "Sarayut Winuthayanon"
git config --global user.email "s.winuthayanon@missouri.edu"
git config --global core.autocrlf input
git config --global init.defaultBranch main
git config --global core.editor "vim"
vim --help|less
git config --help

docker system prune -a

cd ~/git/slurm-docker-cluster-1/
docker compose build
docker images
docker compose up -d
docker ps
./add_user_to_containers.sh 
docker exec -it --user sw7v6 slurmctld /bin/bash
docker exec -it --user root slurmctld /bin/bash

srun -N 3 hostname
srun -N 2 nvidia-smi
srun -N 3 /data/bin/hc -b -m 1800

salloc -p requeue --gres=gpu:A100:1
