#!/usr/bin/env bash
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu
#SBATCH --mem=8G
#SBATCH -J mlc_cifar10_flip_K_1
#SBATCH -o "/homes/evgeny/nobackup/log/mlc_cifar10_flip_K_1_%j.out"
#SBATCH -e "/homes/evgeny/nobackup/log/mlc_cifar10_flip_K_1_%j.err"

. ~/.bashrc
module load cuda/11.8.0
micromamba activate mlc
cd ~/code/MLC
python3 main.py --dataset cifar10 --optimizer sgd --bs 100 --corruption_type flip --method hmlc_K --gradient_steps 1 --corruption_level 0.6 --gold_fraction 0.02 --epochs 120 --main_lr 0.1 --meta_lr 3e-4 --runid cifar10_flip_K_1  --cls_dim 128 --data_path ~/nobackup/cifar/ --logdir ~/nobackup/log/
