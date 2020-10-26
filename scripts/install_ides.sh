#!/bin/bash

# This script installs all of the IDE's used
# QT, meld, sublime, and atom
# GUI Tools - meld, gitg, gitk, git-cola, gedit

wget -qO - http://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb http://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
rm -rf /var/lib/apt/lists/*
apt-get update

apt-get install -y --no-install-recommends sublime-text

apt-get install -y --no-install-recommends libgconf-2-4 libnss3 gvfs-bin xdg-utils libxss1 libxkbfile1 libcurl3 libasound2 policykit-1
cd /root
wget https://atom.io/download/deb
dpkg -i deb
rm deb

apt-get install -y --no-install-recommends meld gitg gitk git-cola gedit adwaita-icon-theme-full


#apt-get install -y --no-install-recommends qt5-default qtcreator build-essential qt5-doc qt5-doc-html qtbase5-doc-html qtbase5-examples libfontconfig1 mesa-common-dev libglu1-mesa-dev
export PATH=/opt/qt515/bin:$PATH
export LD_LIBRARY_PATH=/opt/qt515/lib:$LD_LIBRARY_PATH
cd /tmp
wget http://server-ubuntu18/qt/qt-creator-opensource-src-4.13.1.tar.gz
tar xvf qt-creator-opensource-src-4.13.1.tar.gz
rm qt-creator-opensource-src-4.13.1.tar.gz
cd qt-creator-opensource-src-4.13.1
mkdir qt-creator-build
cd qt-creator-build
qmake ../qtcreator.pro
make qmake_all
make -j8
make install INSTALL_ROOT=/opt/qtcreator


rm -rf /var/lib/apt/lists/*
rm -rf /tmp/qt-creator-opensource-src-4.13.1
