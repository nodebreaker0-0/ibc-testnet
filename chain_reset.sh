sudo service gaiad stop
sudo service bandd stop
sudo service osmosisd stop
sudo service terrad stop
sudo service iris stop
sudo service sentinelhub stop
sudo service regen stop
sudo service akash stop
sudo service cro stop
sudo service persistenceCore stop

gaiad unsafe-reset-all
bandd unsafe-reset-all
terrad unsafe-reset-all
osmosisd unsafe-reset-all
iris unsafe-reset-all
sentinelhub unsafe-reset-all
regen unsafe-reset-all
akash unsafe-reset-all
chain-maind unsafe-reset-all
persistenceCore unsafe-reset-all

sudo service gaiad start
sudo service bandd start
sudo service osmosisd start
sudo service terrad start
sudo service iris start
sudo service sentinelhub start
sudo service regen start
sudo service akash start
sudo service cro start
sudo service persistenceCore start
