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


sleep 6s
sudo service gaiad status | grep Active
curl -s http://localhost:26657/status | jq '.result.sync_info.latest_block_height'

sudo service bandd status | grep Active
curl -s http://localhost:26557/status | jq '.result.sync_info.latest_block_height'

sudo service terrad status | grep Active
curl -s http://localhost:26257/status | jq '.result.sync_info.latest_block_height'

sudo service osmosisd status | grep Active
curl -s http://localhost:26457/status | jq '.result.sync_info.latest_block_height'

sudo service iris status | grep Active
curl -s http://localhost:26357/status | jq '.result.sync_info.latest_block_height'

sudo service sentinelhub status | grep Active
curl -s http://localhost:26157/status | jq '.result.sync_info.latest_block_height'

sudo service regen status | grep Active
curl -s http://localhost:26757/status | jq '.result.sync_info.latest_block_height'

sudo service akash status | grep Active
curl -s http://localhost:26857/status | jq '.result.sync_info.latest_block_height'

sudo service cro status | grep Active
curl -s http://localhost:26957/status | jq '.result.sync_info.latest_block_height'

sudo service persistenceCore status | grep Active
curl -s http://localhost:36657/status | jq '.result.sync_info.latest_block_height'