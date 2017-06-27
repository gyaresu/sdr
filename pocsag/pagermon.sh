# https://github.com/davidmckenzie/pagermon

sudo apt-get install npm sqlite3
sudo npm install npm@latest -g
sudo npm install pm2 -g
sudo ln -s /usr/bin/nodejs /usr/bin/node
git clone https://github.com/davidmckenzie/pagermon
cp ~/gnuradio-live-setup/pocsag/process.json ~/pagermon/server/process.json
