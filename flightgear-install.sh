# Install the Flightgear package
if [ $(dpkg-query -W -f='${Status}' flightgear 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get update;
  sudo apt-get install flightgear -y;
fi

# TODO
# Setup AIS and ADSB selectors and the relevant software to feed into Flightgear