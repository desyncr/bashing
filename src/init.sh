# -------------------------------------------------------------------
# Metadata
BASHING_ROOT=$(cd "$(dirname "$0")" && pwd)
BASHING_VERSION="$__VERSION"
BASHING_PROJECT_FILE="bashing.project"
CWD=$(pwd)
PROJECT_ROOT=$(pwd)

# -------------------------------------------------------------------
# Find Root
case "$1" in
    compile|uberbash|run|clean|new.*)
        while [ -d "$PROJECT_ROOT" ]; do
            if [ -e "$PROJECT_ROOT/$BASHING_PROJECT_FILE" ]; then break; fi
            PROJECT_ROOT="$PROJECT_ROOT/.."
        done

        if [ ! -d "$PROJECT_ROOT" ]; then
            echo "Could not find Root Directory of this Project!" 1>&2
            exit 1;
        fi

        PROJECT_ROOT=$(cd "$PROJECT_ROOT" && pwd);
    ;;
esac
PROJECT_FILE="$PROJECT_ROOT/$BASHING_PROJECT_FILE"

# Derive Paths
SRC_PATH="$PROJECT_ROOT/src"
CLI_PATH="$SRC_PATH/tasks"
LIB_PATH="$SRC_PATH/lib"
HID_PATH="$SRC_PATH/hidden-tasks"
