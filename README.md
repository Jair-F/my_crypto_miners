# My Crypto Miners

This repository contains the configuration to run cryptocurrency miners inside a Docker container.

## Miners Included

-   **Monero**: `xmrig`
-   **Raven**: `gminer`

## Prerequisites

This setup requires Docker and the NVIDIA Container Toolkit to be installed on the host machine to allow containers to use NVIDIA GPUs.

### Install NVIDIA Container Toolkit (Debian/Ubuntu)

The following instructions are for Debian-based distributions like Ubuntu.

1.  Add the NVIDIA GPG key and repository.

    ```bash
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/debian/$(lsb_release -cs) /" | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
    ```

2.  Update your package list and install the toolkit.

    ```bash
    sudo apt-get update
    sudo apt-get install -y nvidia-container-toolkit
    ```

## How to Run

To run the miners, execute the following Docker command:

```bash
docker run -it --rm --gpus all my_crypto_miners:latest
```

or

```bash
docker compose up
```
