# My Crypto Miners

This repository contains the configuration to run cryptocurrency miners inside a Docker container.

## Miners Included

- **Monero**: `xmrig`
- **Raven**: `gminer`

## Prerequisites

This setup requires Docker and the NVIDIA Container Toolkit to be installed on the host machine to allow containers to use NVIDIA GPUs.

### Install NVIDIA Container Toolkit (Debian/Ubuntu)

The following instructions are for Debian-based distributions like Ubuntu.

1. **Add the NVIDIA GPG key and repository.**

   ```bash
   curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/debian/$(lsb_release -cs) /" | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
   ```

2. **Update your package list and install the toolkit.**

   ```bash
   sudo apt-get update
   sudo apt-get install -y nvidia-container-toolkit
   ```

## Getting Started

### 1. Build the Docker Image

First, build the Docker image using the `Dockerfile` in this repository.

```bash
docker build -t my_crypto_miners:latest .
```

### 2. Configuration

Before running the miners, you will need to configure your wallet addresses and pool information.

*(Note: You should add instructions here on how to configure the miners, e.g., by editing a config file or using environment variables.)*

### 3. Run the Miners

You can run the miners using either a direct `docker run` command or with `docker compose`.

#### Option A: Using `docker run`

This command runs a new container from the image, provides access to all available GPUs, and automatically removes the container on exit.

```bash
docker run -it --rm --gpus all jairf/my_crypto_miners:latest
```

#### Option B: Using `docker compose`

If you have a `docker-compose.yml` file configured, you can easily manage the container's lifecycle with `docker compose`.

```bash
docker compose up
```
