#!/usr/bin/env bash
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu
#SBATCH --mem=8G
#SBATCH -J mlc_cifar10
#SBATCH -o "/homes/evgeny/nobackup/log/mlc_cifar10_%j.out"
#SBATCH -e "/homes/evgeny/nobackup/log/mlc_cifar10_%j.err"

. ~/.bashrc
module load cuda/11.8.0
micromamba activate mlc
cd ~/code/MLC
python3 main.py --dataset cifar10 --optimizer sgd --bs 100 --corruption_type unif --corruption_level 0.4 --gold_fraction 0.02 --epochs 120 --main_lr 0.1 --meta_lr 3e-4 --runid cifar10_run  --cls_dim 128 --data_path ~/nobackup/cifar/ --logdir ~/nobackup/log/
