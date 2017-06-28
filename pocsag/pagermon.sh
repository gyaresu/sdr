# https://github.com/davidmckenzie/pagermon

sudo apt-get install npm sqlite3
sudo npm install npm@latest -g
sudo npm install pm2 -g
sudo ln -s /usr/bin/nodejs /usr/bin/node
git clone https://github.com/davidmckenzie/pagermon
cp ~/gnuradio-live-setup/pocsag/process.json ~/pagermon/server/process.json
sudo chown -R $USER:$(id -gn $USER) /home/ubuntu/.config
cd ~/pagermon/server
npm install
export NODE_ENV=production
pm2 start process.json
cd ~/pagermon/client
npm install
