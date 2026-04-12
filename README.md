# Configuration dotfiles

Automated setup for Ansible, personal tools, and their config files.
Should be distro independant

## What it does

- Installs Ansible and required dependencies via base package manager
- Sync non-sensitive dotfile configs
- Automate personal tool installation via Ansible playbook

## Usage

Run the install script for all the tools:

```bash
./install_tools.sh
```

Sync settings:
```bash
./sync_configs.sh
```

Restore settings:
```bash
./restore_configs.sh
```

