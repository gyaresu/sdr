# GNU Radio Live SDR setup scripit
# https://wiki.gnuradio.org/index.php/GNU_Radio_Live_SDR_Environment
# gareth@greenpeace.org
# 2017-06-21

# Install the GNURadio Iridium Decoder
if [ $(dpkg-query -W -f='${Status}' iridium-extractor 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  cd $HOME
  git clone https://github.com/muccc/gr-iridium.git
  cd $HOME/gr-iridium 
  mkdir build
  cd build
  cmake ..
  make
  sudo make install
  sudo ldconfig
fi

if [ ! -d $HOME/iridium-toolkit ]; then
  cd $HOME
  git clone https://github.com/muccc/iridium-toolkit.git
  cd $HOME/iridium-toolkit
  export PATH=$PATH:$HOME/iridium-toolkit
fi

# Setup hackrf_sweep

