# ADSB presentation in Firefox
cd ~
if [ ! -d "dump1090" ]; then
    git clone https://github.com/antirez/dump1090.git
    cd dump1090
    make
fi

cd ~/dump1090
./dump1090  --net >/dev/null 2>&1 &
firefox localhost:8080 >/dev/null 2>&1 &
