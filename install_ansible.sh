#!/bin/bash

detect_distro() {
    local distro=""
    if [ -f /etc/os-release ]; then
        . /etc/os-release

        case "$ID" in
            arch|manjaro|endeavouros|cachyos)
                distro="arch"
                ;;
            debian|ubuntu|linuxmint|pop)
                distro="debian"
                ;;
            fedora|rhel|centos|rocky|alma)
                distro="fedora"
                ;;
        esac

        if [ -z "$distro" ] && [ -n "$ID_LIKE" ]; then
            case "$ID_LIKE" in
                *arch*)
                    distro="arch"
                    ;;
                *debian*|*ubuntu*)
                    distro="debian"
                    ;;
                *fedora*|*rhel*|*centos*)
                    distro="fedora"
                    ;;
            esac
        fi

        [ -z "$distro" ] && distro="$ID"
    else
        distro="unknown"
    fi
    echo "$distro"
}

install_ansible() {
    local distro=$(detect_distro)

    case "$distro" in
        arch)
            echo "Detected Arch-based distro. Installing Ansible via pacman..."
            sudo pacman -Sy --noconfirm ansible
            ;;
        debian)
            echo "Detected Debian-based distro. Installing Ansible via apt..."
            sudo apt update
            sudo apt install -y ansible
            ;;
        fedora)
            echo "Detected Fedora-based distro. Installing Ansible via dnf..."
            sudo dnf install -y ansible
            ;;
        *)
            echo "Unsupported distribution: $distro"
            exit 1
            ;;
    esac

    echo "Ansible version:"
    ansible --version
}

install_ansible
