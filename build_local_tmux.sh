#!/bin/bash
# Install Tmux without root
# Tmux depends on libevent and ncurses, which will be installed first.
# Tested on a server using Centos 6.10, 7.5
# Based on:
#   + https://gist.github.com/joegross/655aa118119b5b02a6d76e052dd7fac7
#   + https://gist.github.com/ryin/3106801

set -e

TMUX_VERSION=2.7
LIBEVENT_VERSION=2.1.8-stable
NCURSES_VERSION=6.0
DIR="${HOME}/.local"
DIR_SRC="${HOME}/src"

mkdir -p "$DIR"
mkdir -p "$DIR_SRC"

cd "$DIR_SRC"
wget -N https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION/libevent-$LIBEVENT_VERSION.tar.gz
tar -xzf libevent-$LIBEVENT_VERSION.tar.gz
cd libevent-$LIBEVENT_VERSION
./configure --prefix="$DIR" --disable-shared
make install

cd "$DIR_SRC"
wget -N https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz
tar -xzf ncurses-$NCURSES_VERSION.tar.gz
cd ncurses-$NCURSES_VERSION
./configure CPPFLAGS="-P" --prefix="$DIR"
make install

cd "$DIR_SRC"
wget -N https://github.com/tmux/tmux/releases/download/$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz
tar -xzf tmux-$TMUX_VERSION.tar.gz
cd tmux-$TMUX_VERSION
C_LIBS="-I${DIR}/include -I${DIR}/include/ncurses"
LD_LIBS="-L${DIR}/lib -L${DIR}/include -L${DIR}/include/ncurses"
./configure --prefix="$DIR" CFLAGS="$C_LIBS" LDFLAGS="$LD_LIBS"
CPPFLAGS="$C_LIBS" LDFLAGS='-static '"$LD_LIBS" make install

# Finally, add to path. Better to have it permanently in .bashrc or .zshrc
echo "PATH=${DIR}/bin:"'"$PATH"' >> ~/.bashrc && source ~/.bashrc
#export PATH="${DIR}/bin:${PATH}"
tmux -V

# Clean up
rm -r "$DIR_SRC"
