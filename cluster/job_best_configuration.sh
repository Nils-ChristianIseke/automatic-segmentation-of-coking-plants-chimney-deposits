#!/bin/sh
#SBATCH --time=00:10:00
#SBATCH --gres=gpu:4
#SBATCH --container-name=nvidia_pytorch_23_06
#SBATCH --container-writable
#SBATCH --container-remap-root
#SBATCH --container-mounts=/etc/slurm/task_prolog:/etc/slurm/task_prolog,/scratch:/scratch,/pfs/work7/workspace/scratch/hd_oy280-pipe:/workspace
#SBATCH --error=error_job
#SBATCH --output=output_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nilsmailiseke@gmail.com
#SBATCH --job-name=nnUnet_job


. setup_paths.sh
nnUNetv2_find_best_configuration Dataset002_pipe -tr nnUNetTrainer_50epochs -c 2d &> best_configuration.txt
