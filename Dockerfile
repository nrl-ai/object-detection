FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
ENV http_proxy=http://107.120.133.27:3128; https_proxy=http://107.120.133.27:3128
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /workspace

# Configure library
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV PYTHONPATH=/workspace

COPY requirements.txt /requirements.txt

RUN python -m pip install --upgrade pip && python -m pip install -r /requirements.txt
ENV http_proxy =\
    https_proxy =
COPY . /workspace
WORKDIR /workspace

CMD ["bash"]
