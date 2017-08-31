# ADSB presentation in Firefox
cd ~
if [ ! -d "dump1090" ]; then
    git clone https://github.com/antirez/dump1090.git
    cd dump1090
    make
fi

cd ~/dump1090

case "$(pidof dump1090 | wc -c)" in

0)  echo "Starting dump1090"
    ./dump1090  --interactive --net >/dev/null 2>&1 &
    ;;
1)  echo "Killing dump1090"
    pkill -9 dump1090
    pkill -9 firefox
    ;;
esac
