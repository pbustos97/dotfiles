if command -v ansible >/dev/null 2>&1; then
    echo "Ansible is installed"
else
    echo "Ansible is not installed"
    echo "Installing ansible"
    ./install_scripts/install_ansible.sh
fi

# Run ansible playbook with sudo permissions for install
ansible-playbook -K install_tools.yml
