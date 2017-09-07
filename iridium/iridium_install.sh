# GNU Radio Live SDR setup scripit
# https://wiki.gnuradio.org/index.php/GNU_Radio_Live_SDR_Environment
# gareth@greenpeace.org
# 2017-06-21

# Install the GNURadio Iridium Decoder
if [ $(dpkg-query -W -f='${Status}' iridium-extractor 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
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

# Install the Iridium Decoder
if [ ! -d $HOME/iridium-toolkit ]; then
  cd $HOME
  git clone https://github.com/muccc/iridium-toolkit.git
  export PATH="$PATH:$HOME/iridium-toolkit:$HOME/osmo-ir77/codec"
fi

# Install the Iridium phone call audio codec
if [ ! -d $HOME/osmo-ir77 ]; then
  cd $HOME
  git clone http://git.osmocom.org/osmo-ir77
  cd $HOME/osmo-ir77/codec
  make
fi


# Add Iridium Decoder scripts to $PATH and export to local shell
if [ $(fgrep -c 'iridium' 2>/dev/null) -eq 0]; then
  echo PATH="$PATH:$HOME/iridium-toolkit" >> $HOME/.profile
  export PATH="$PATH:$HOME/iridium-toolkit"
fi

# Add the codec binary to $PATH and export to local shell
if [ $(fgrep -c 'ir77' 2>/dev/null) -eq 0]; then
  echo PATH="$PATH:$HOME/osmo-ir77/codec" >> $HOME/.profile
  export PATH="$PATH:$HOME/osmo-ir77/codec"
fi
