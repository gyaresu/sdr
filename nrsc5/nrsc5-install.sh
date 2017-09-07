# http://theori.io/research/nrsc-5-c
# Listening to HD Radio (NRSC-5)

# Install the HD Radio software
if [ ! -d $HOME/nrsc5 ]; then
  cd $HOME
  git clone https://github.com/theori-io/nrsc5.git
  sudo apt-get install libao-dev -y
  cd nrsc5
  mkdir build
  cd build
  cmake ..
  make
  sudo make install
  echo "Installation successfull"  
fi

