# ADSB presentation in Flightgear

if [ ! -d "gr-air-modes" ]; then
    cd ~
    git clone https://github.com/bistromath/gr-air-modes
    cd gr-air-modes
    mkdir build
    cd build
    cmake ../
    make
    sudo make install
    sudo ldconfig
    sudo apt-get install flightgear -y

fi

# case "$(pidof mode_rx | wc -w)" in

# 0)  echo "Starting Flightgear"
#     ./dump1090  --net >/dev/null 2>&1 &
#     firefox localhost:8080 >/dev/null 2>&1 &
#     ;;
# 1)  echo "Killing dump1090"
#     pkill -9 dump1090
#     pkill -9 firefox
#     ;;
# esac