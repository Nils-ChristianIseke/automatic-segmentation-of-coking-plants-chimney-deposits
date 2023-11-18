#!/bin/bash
cd MobileSAM && pip install -e .
cd ..
pip install timm
cd nnSAM && pip install -e .
cd ..