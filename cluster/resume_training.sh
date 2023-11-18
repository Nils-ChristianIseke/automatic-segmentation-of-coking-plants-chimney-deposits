#!/bin/bash
CUDA_VISIBLE_DEVICES=0 nnUNetv2_train 002 2d  -tr nnUNetTrainer_50epochs --c 0 --npz -device cuda &
CUDA_VISIBLE_DEVICES=1 nnUNetv2_train 002 2d -tr nnUNetTrainer_50epochs --c 1 --npz -device cuda &
CUDA_VISIBLE_DEVICES=2 nnUNetv2_train 002 2d -tr nnUNetTrainer_50epochs --c 2 --npz -device cuda &
CUDA_VISIBLE_DEVICES=3 nnUNetv2_train 002 2d -tr nnUNetTrainer_50epochs --c 3 --npz -device cuda