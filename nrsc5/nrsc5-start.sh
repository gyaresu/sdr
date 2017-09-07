if [ -d $HOME/nrsc5 ]; then
  xz -d < $HOME/nrsc5/support/sample.xz | nrsc5 -r - 0
else
  "Please run the nrsc5-install.sh script"
fi