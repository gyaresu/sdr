# ADSB presentation in Firefox
if [ ! -d "dump1090" ]; then
    git clone https://github.com/antirez/dump1090.git
make
fi

cd ~/gnuradio-live-setup/dump1090
./dump1090  --net >/dev/null 2>&1 &
firefox localhost:8080 >/dev/null 2>&1 &

