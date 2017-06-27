# http://theori.io/research/nrsc-5-c
# Listening to HD Radio (NRSC-5)
cd ~
sudo apt-get install libao-dev
mkdir build
cd build
cmake ..
make
sudo make install
xz -d < ../support/sample.xz | nrsc5 -r - 0
