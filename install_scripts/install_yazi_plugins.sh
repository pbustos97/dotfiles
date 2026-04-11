SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/install_funcs.sh"

install_yazi_plugin "piper"
install_yazi_plugin "git"
