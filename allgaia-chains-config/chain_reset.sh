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

gaiad unsafe-reset-all --home ~/.gaiad1
gaiad unsafe-reset-all --home ~/.gaiad2
gaiad unsafe-reset-all --home ~/.gaiad3
gaiad unsafe-reset-all --home ~/.gaiad4
gaiad unsafe-reset-all --home ~/.gaiad5
gaiad unsafe-reset-all --home ~/.gaiad6
gaiad unsafe-reset-all --home ~/.gaiad7
gaiad unsafe-reset-all --home ~/.gaiad8
gaiad unsafe-reset-all --home ~/.gaiad9
gaiad unsafe-reset-all --home ~/.gaiad10

sudo service gaiad1 start
sudo service gaiad2 start
sudo service gaiad3 start
sudo service gaiad4 start
sudo service gaiad5 start
sudo service gaiad6 start
sudo service gaiad7 start
sudo service gaiad8 start
sudo service gaiad9 start
sudo service gaiad10 start


sleep 6s
sudo service gaiad1 status | grep Active
curl -s http://localhost:26057/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad2 status | grep Active
curl -s http://localhost:26157/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad3 status | grep Active
curl -s http://localhost:26257/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad4 status | grep Active
curl -s http://localhost:26357/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad5 status | grep Active
curl -s http://localhost:26457/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad6 status | grep Active
curl -s http://localhost:26557/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad7 status | grep Active
curl -s http://localhost:26657/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad8 status | grep Active
curl -s http://localhost:26757/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad9 status | grep Active
curl -s http://localhost:26857/status | jq '.result.sync_info.latest_block_height'

sudo service gaiad10 status | grep Active
curl -s http://localhost:26957/status | jq '.result.sync_info.latest_block_height'