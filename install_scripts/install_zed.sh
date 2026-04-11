SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/install_funcs.sh"

install_with_curl "zed" "https://zed.dev/install.sh" "sh"
