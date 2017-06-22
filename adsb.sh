sudo apt-get update
sudo apt-get install socat -y
git clone https://github.com/antirez/dump1090.git
cd dump1090
make
./dump1090  --net >/dev/null 2>&1 &
firefox localhost:8080 >/dev/null 2>&1 &

