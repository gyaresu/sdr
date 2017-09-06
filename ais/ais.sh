# AIS

if [ $(dpkg-query -W -f='${Status}' rtl-sdr 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install rtl-sdr libusb-1.0-0-dev;
fi

if [ $(dpkg-query -W -f='${Status}' opencpn 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo add-apt-repository ppa:opencpn/opencpn -y
  sudo apt-get update
  sudo apt-get install opencpn -y # Getting 88 MB of files(!)
                                  # TODO: create local repository for apt packages
fi

if [ ! -d "$HOME/rtl-ais" ]; then
  git clone https://github.com/dgiardini/rtl-ais
  cd $HOME/rtl-ais
  make
fi


$HOME/ais/rtl-ais/rtl_ais -p 0 -R on -n -h 127.0.0.1



