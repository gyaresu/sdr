# AIS

if [ $(dpkg-query -W -f='${Status}' rtl-sdr 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install rtl-sdr libusb-1.0-0-dev;
fi

if [ ! -d "$HOME/ais" ]; then
  mkdir $HOME/ais
fi

cd $HOME/ais
git clone https://github.com/dgiardini/rtl-ais
cd ./rtl-ais
make

sudo add-apt-repository ppa:opencpn/opencpn -y
sudo apt-get update
sudo apt-get install opencpn -y # Getting 88 MB of files(!)
                                # TODO: create local repository for apt packages

$HOME/ais/rtl-ais/rtl_ais -p 0 -R on -n -h 127.0.0.1



