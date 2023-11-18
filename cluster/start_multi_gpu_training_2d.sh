#!/bin/bash
CUDA_VISIBLE_DEVICES=0 nnUNetv2_train 002 2d 0 -tr nnUNetTrainer_50epochs --npz -device cuda &
CUDA_VISIBLE_DEVICES=1 nnUNetv2_train 002 2d 1 -tr nnUNetTrainer_50epochs --npz -device cuda &
CUDA_VISIBLE_DEVICES=2 nnUNetv2_train 002 2d 2 -tr nnUNetTrainer_50epochs --npz -device cuda &
CUDA_VISIBLE_DEVICES=3 nnUNetv2_train 002 2d 3 -tr nnUNetTrainer_50epochs --npz -device cuda 
