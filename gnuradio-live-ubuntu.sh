# GNU Radio Live SDR setup scripit
# https://wiki.gnuradio.org/index.php/GNU_Radio_Live_SDR_Environment
# gareth@greenpeace.org
# 2017-06-21

sudo apt-get update
#sudo apt-get upgrade --force-yes

# Install the GNURadio Iridium Decoder
git clone git@github.com:muccc/gr-iridium.git
cd gr-iridium 
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig


