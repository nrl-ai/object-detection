# OpenVI - Object Detection Training

## Environment preparation

Requirement: Python >= 3.8

### Install libraries and dependencies:

```bash
conda create -n nanodet_env python=3.9
conda activate nanodet_env
pip install -r requirement.txt
python setup.py develop
```

## Docker (dev)

### Build docker image

```
docker build -t nanodet_train .
```

### Start new docker container

```
docker run -it -d --restart always --shm-size=32GB --gpus=all -v `pwd`/workspace:/workspace/out_snapshot -v `pwd`/dataset:/workspace/dataset --name nanodet_train nanodet_train:latest
```

### Run training ([resnet18, resnet34, resnet50, mobilenet_v2, mobilenet_v3_small])

```
python tools/train.py --config config/nanodet-plus-m_416.yml
```

### Run export model

```
python tools/export_onnx.py --cfg_path config/nanodet-plus-m_416.yml --model workspace/nanodet-plus-m_416/model_best/nanodet_model_best.pth
```
