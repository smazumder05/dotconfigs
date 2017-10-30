#!/bin/bash 
LATEST_VERSION="1.9.2"    #latest available version, use if version not specified
INSTALL_VERSION=$LATEST_VERSION
INSTALL_DIR=$HOME/lang/golang

# Generic error handling function
error_exit() {
    echo "$1"  1>&2
    exit 1
}

showhelp() {
    echo "USAGE: installs golang to your home directory."
    echo -e  "\nOPTIONS: "
    echo -e  "--version\t install the given version"
    echo -e  "--list\t show currently installed version"
    echo -e  "--remove\t to remove currently installed version."
}

# Remove older versions of golang, before installing new version.
remove() {
  # version to be removed
  lversion=$1
  echo "Romoving $INSTALL_DIR/go$lversion"
  # Check if the .go directory exists before removing it
  if [ -d "$INSTALL_DIR/go$lversion" ]; then
    echo "Removing current golang installation directory."
    rm -rf "$INSTALL_DIR/go$lversion"
    echo "golang removed."
  else 
      echo "No current golang installation found."
  fi
}

# Downloads the correct version of golang. if no version is specified then
# the default version will be used. See VERSION defined above 
# requires the version as argument
# sample usage: fetch 1.9.2
#
download() {
  lver=$INSTALL_VERSION
  if [ $# -eq 0 ];  then
      echo "using default golang version to install."
      echo " $lver"
  else
      lver=$1
  fi
  echo "using version $lver"
  downloadfile="go$lver.linux-amd64.tar.gz"
  wget -c https://storage.googleapis.com/golang/$downloadfile -O /tmp/go$lver.tar.gz
  if [ $? -ne 0 ]; then
      error_exit "Failed to download golang installation file: $lver"
  fi
}

# Extract and install golang
# Requires the go extract filename

install() {
 goextract=$1
 echo $goextract
 tar -C /tmp -xzf /tmp/go$goextract.tar.gz
 if [ $? -ne 0 ]; then
    error_exit  "echo Failed to extract golang archive file."
 fi
 mv /tmp/go  $INSTALL_DIR/go$INSTALL_VERSION
 if [ $? -ne 0 ]; then
     error_exit "Failed to move golang files to install location"
 fi
 # Create directories for golang library installs
 mkdir -p $INSTALL_DIR/godev/$INSTALL_VERSION/{src,pkg,bin}
 # update .bashrc with new GOROOT and GOPATH settings

 if [ $? -ne 0 ]; then
     echo "Failed to update bashrc file. Do it manually"
 fi
}

# Test the install
test_install() {
  bash source "$HOME/.bashrc"
  go version
  exit 0
}

cleanup() {
    echo "Cleaning up all downloaded files"
    rm -rf /tmp/go$INSTALL_VERSION.tar.gz 
    exit 0
}


main() {
    if [ "$1" == "--version" ]; then
        INSTALL_VERSION=$2
        echo "Installing version: $INSTALL_VERSION"
        download
        install $INSTALL_VERSION
        cleanup
        test_install
    elif [ "$1" == "--list" ]; then
        echo "All currently install golang version under $INSTALL_DIR"
        ls $INSTALL_DIR
    elif [ "$1" == "--remove" ]; then
        remove $2
    else 
        showhelp
    fi
    exit 0
}

# Call install main function here
main $@
