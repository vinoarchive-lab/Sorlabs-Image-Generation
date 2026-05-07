FROM runpod/comfyui:latest

WORKDIR /workspace/ComfyUI

# Create required folders
RUN mkdir -p models/checkpoints \
    models/vae \
    models/loras \
    models/unet \
    models/text_encoders \
    models/diffusion_models

# Install huggingface_hub
RUN pip install huggingface_hub

# Download files into correct folders
RUN huggingface-cli download Comfy-Org/z_image_turbo split_files/text_encoders/qwen_3_4b.safetensors --local-dir models/text_encoders && \
    huggingface-cli download Comfy-Org/z_image_turbo split_files/diffusion_models/z_image_turbo_bf16.safetensors --local-dir models/diffusion_models && \
    huggingface-cli download Comfy-Org/z_image_turbo split_files/vae/ae.safetensors --local-dir models/vae
