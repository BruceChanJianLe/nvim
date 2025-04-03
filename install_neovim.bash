#!/usr/bin/env bash
# This script will install latest neovim

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat <<EOF
  Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-r] [-d]
  Script description here.
  Available options:
  -h, --help          Print this help and exit
  -a, --auto          Set true to auto select the last branch in the list
  -d, --depedencies   Set false to not install depedencies, true by default
EOF
exit
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  AUTO_SELECT="false"
  BRANCH=""
  DEPS="true"
  NEOVIM_DIR="$HOME/reference/neovim.git"

  while test $# -gt 0; do
    case $1 in
      -h | --help) usage ;;
      -a | --auto)
        shift
        if [[ $1 == "true" || $1 == "false" ]]
        then
          AUTO_SELECT=$1
        else
          die "-a only accepts true or false."
        fi
        ;;
      -d | --depedencies)
        shift
        if [[ $1 == "true" || $1 == "false" ]]
        then
          DEPS=$1
        else
          die "-d only accepts true or false."
        fi
        ;;
      -?*) die "Unknown option: $1" ;;
      *) break ;;
    esac
    shift
  done

  return 0
}

parse_params "$@"
setup_colors 

# Get current dir path
CURRENT_DIR="$(pwd)"

# Install build depedencies for neovim
if [[ $DEPS == "true" ]]
then
  echo "Installing depedencies for building neovim..."
  sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen ripgrep -y -qq
  sudo apt-get install python3-venv luarocks imagemagick -y -qq
fi

# Checks if neovim directory already exists
if [ ! -d "$NEOVIM_DIR" ]
then
  mkdir -p $HOME/reference
  cd $HOME/reference
  git clone --bare https://github.com/neovim/neovim.git
  cd $NEOVIM_DIR
  git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git fetch
else
  cd $NEOVIM_DIR
  git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git fetch
fi

if [[ $AUTO_SELECT == "false" ]]
then
  # Display all available branches
  echo "Available branches:"
  declare -a arr
  i=0

    # Make branches name into an array
    branches=$(git for-each-ref refs  --format='%(refname)' | grep origin | cut -d/ -f4 | sort -V)
    for branch in $branches
    do
      arr[$i]=$branch
      let "i+=1"
    done

    # Loop through name array
    let "i-=1"
    for j in $(seq 0 $i)
    do
      echo $j")" ${arr[$j]}
    done

    # Obtain branch name
    read -p "Neovim Branch to be used: " BRANCH
    if [ -d  ${arr[$BRANCH]} ]
    then
      cd ${arr[$BRANCH]}
    else
      git worktree add ${arr[$BRANCH]} ${arr[$BRANCH]}
      cd ${arr[$BRANCH]}
    fi

    # Building Neovim
    # mkdir build
    # cd build
    # cmake ..
    # https://github.com/neovim/neovim/issues/3258
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install

    echo -e $GREEN"Successfully installed neovim, remember to setup your alias! :)"$NOFORMAT

  else
    declare -a arr
    i=0

    # Make branches name into an array
    branches=$(git for-each-ref refs  --format='%(refname)' | grep origin | cut -d/ -f4 | sort -V)
    for branch in $branches
    do
      arr[$i]=$branch
      let "i+=1"
    done
    let "i-=1"

    if [ -d  ${arr[$i]} ]
    then
      cd ${arr[$i]} 
    else
      git worktree add ${arr[$i]} ${arr[$i]}
      cd ${arr[$i]}
    fi

    # Building Neovim
    # mkdir build
    # cd build
    # cmake ..
    # https://github.com/neovim/neovim/issues/3258
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install

    echo -e $GREEN"Successfully installed neovim, remember to setup your alias!:)\n
    Use Bitstream Vera Sans Mono size 11 :)"$NOFORMAT
fi
