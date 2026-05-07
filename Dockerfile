FROM runpod/base:0.4.0-cuda12.1.0

WORKDIR /workspace

# Clone your repo
RUN git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git .

# Create folder structure
RUN mkdir -p /workspace/models/unet \
    /workspace/models/vae \
    /workspace/models/loras \
    /workspace/models/checkpoints

# Install huggingface_hub
RUN pip install huggingface_hub

# Download models into correct folders
RUN huggingface-cli download YOUR_USERNAME/MODEL_REPO unet_file.safetensors --local-dir /workspace/models/unet && \
    huggingface-cli download YOUR_USERNAME/MODEL_REPO vae_file.safetensors --local-dir /workspace/models/vae && \
    huggingface-cli download YOUR_USERNAME/MODEL_REPO lora_file.safetensors --local-dir /workspace/models/loras && \
    huggingface-cli download YOUR_USERNAME/MODEL_REPO checkpoint_file.safetensors --local-dir /workspace/models/checkpoints
