sudo service gaiad1 stop
sudo service gaiad2 stop
sudo service gaiad3 stop
sudo service gaiad4 stop
sudo service gaiad5 stop
sudo service gaiad6 stop
sudo service gaiad7 stop
sudo service gaiad8 stop
sudo service gaiad9 stop
sudo service gaiad10 stop

sudo rm -r ~/.gaiad1
sudo rm -r ~/.gaiad2
sudo rm -r ~/.gaiad3
sudo rm -r ~/.gaiad4
sudo rm -r ~/.gaiad5
sudo rm -r ~/.gaiad6
sudo rm -r ~/.gaiad7
sudo rm -r ~/.gaiad8
sudo rm -r ~/.gaiad9
sudo rm -r ~/.gaiad10

sudo systemctl disable gaiad1.service
sudo systemctl disable gaiad2.service
sudo systemctl disable gaiad3.service
sudo systemctl disable gaiad4.service
sudo systemctl disable gaiad5.service
sudo systemctl disable gaiad6.service
sudo systemctl disable gaiad7.service
sudo systemctl disable gaiad8.service
sudo systemctl disable gaiad9.service
sudo systemctl disable gaiad10.service

sudo rm /etc/systemd/system/gaiad1.service
sudo rm /etc/systemd/system/gaiad2.service
sudo rm /etc/systemd/system/gaiad3.service
sudo rm /etc/systemd/system/gaiad4.service
sudo rm /etc/systemd/system/gaiad5.service
sudo rm /etc/systemd/system/gaiad6.service
sudo rm /etc/systemd/system/gaiad7.service
sudo rm /etc/systemd/system/gaiad8.service
sudo rm /etc/systemd/system/gaiad9.service
sudo rm /etc/systemd/system/gaiad10.service