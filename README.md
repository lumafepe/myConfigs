# Auto-Install Packages and Configuration Files

This repository contains a bash script that automates the installation of my systems packages and configuration files. The script reads a list of packages from a file, installs them, and moves configuration files to the appropriate locations.

## Prerequisites

- Arch Linux or an Arch-based distribution
- `git` installed to clone this repository
- Internet connection to install packages

## Usage

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/lumafepe/myConfigs.git
    ```

2. Navigate to the repository directory:

    ```bash
    cd myConfigs
    ```

3. Make the script executable:

    ```bash
    chmod +x installer.sh
    ```


4. Run the script to install packages and move configuration files:

    ```bash
    ./install.sh
    ```

## Notes

- If `yay` is not installed, the script will attempt to install it automatically by cloning the `yay` repository from the AUR.
