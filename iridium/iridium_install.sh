# GNU Radio Live SDR setup scripit
# https://wiki.gnuradio.org/index.php/GNU_Radio_Live_SDR_Environment
# gareth@greenpeace.org
# 2017-06-21

# Install the GNURadio Iridium Decoder
if [ $(dpkg-query -W -f='${Status}' iridium-extractor 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  cd $HOME/sdr/iridium/gr-iridium 
  if [ -d build ]; then
    cd build
    sudo make uninstall
    cd ..
    rm -rf build
  fi
  mkdir build
  cd build
  cmake .. -Wno-dev
  make
  sudo make install
  sudo ldconfig
fi

# Install the Iridium phone call audio codec
if [ -d $HOME/sdr/iridium/osmo-ir77/codec ]; then
  cd $HOME/sdr/iridium/osmo-ir77/codec
  if [ -f ir77_ambe_decode ]; then
    make clean
  fi
  make
fi


# Add Iridium Decoder scripts to $PATH and export to local shell
if [ $(echo $PATH | grep -c iridium-toolkit) -lt 1 ]; then
  echo PATH="$PATH:$HOME/sdr/iridium/iridium-toolkit" >> $HOME/.profile
  export PATH="$PATH:$HOME/sdr/iridium/iridium-toolkit"
fi

# Add the codec binary to $PATH and export to local shell
if [ $(echo $PATH | grep -c codec) -lt 1 ]; then
  echo PATH="$PATH:$HOME/sdr/iridiumosmo-ir77/codec" >> $HOME/.profile
  export PATH="$PATH:$HOME/sdr/iridium/osmo-ir77/codec"
fi
