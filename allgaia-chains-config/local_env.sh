git clone https://github.com/informalsystems/ibc-rs
cd ibc-rs
git pull
git checkout v0.5.0
sudo apt install libssl-dev
sudo apt install pkg-config
cargo install ibc-relayer-cli --bin hermes --locked
cd ..
rm -r ibc-rs

#cosmos-sdk v0.42.6
git clone https://github.com/cosmos/gaia
cd gaia
git pull
git checkout v5.0.0
make install
cd ..
rm -r gaia

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

sudo systemctl disable gaiad.service
sudo systemctl disable bandd.service
sudo systemctl disable terrad.service
sudo systemctl disable iris.service
sudo systemctl disable osmosisd.service
sudo systemctl disable sentinelhub.service
sudo systemctl disable regen.service
sudo systemctl disable akash.service
sudo systemctl disable cro.service
sudo systemctl disable persistenceCore.service

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

sudo rm /etc/systemd/system/gaiad.service
sudo rm /etc/systemd/system/bandd.service
sudo rm /etc/systemd/system/terrad.service
sudo rm /etc/systemd/system/iris.service
sudo rm /etc/systemd/system/osmosisd.service
sudo rm /etc/systemd/system/sentinelhub.service
sudo rm /etc/systemd/system/regen.service
sudo rm /etc/systemd/system/akash.service
sudo rm /etc/systemd/system/cro.service
sudo rm /etc/systemd/system/persistenceCore.service

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

gaiad init test --chain-id gaiad1 --home ~/.gaiad1
gaiad init test --chain-id gaiad2 --home ~/.gaiad2
gaiad init test --chain-id gaiad3 --home ~/.gaiad3
gaiad init test --chain-id gaiad4 --home ~/.gaiad4
gaiad init test --chain-id gaiad5 --home ~/.gaiad5
gaiad init test --chain-id gaiad6 --home ~/.gaiad6
gaiad init test --chain-id gaiad7 --home ~/.gaiad7
gaiad init test --chain-id gaiad8 --home ~/.gaiad8
gaiad init test --chain-id gaiad9 --home ~/.gaiad9
gaiad init test --chain-id gaiad10 --home ~/.gaiad10

export WALLET_NAME_VALIDATOR=validator

gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad1
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad2
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad3
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad4
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad5
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad6
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad7
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad8
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad9
gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test --home ~/.gaiad10

export GAIA_DENOM=$(cat ~/.gaiad1/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad1) 100000000000$GAIA_DENOM --home ~/.gaiad1
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad2) 100000000000$GAIA_DENOM --home ~/.gaiad2
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad3) 100000000000$GAIA_DENOM --home ~/.gaiad3
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad4) 100000000000$GAIA_DENOM --home ~/.gaiad4
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad5) 100000000000$GAIA_DENOM --home ~/.gaiad5
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad6) 100000000000$GAIA_DENOM --home ~/.gaiad6
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad7) 100000000000$GAIA_DENOM --home ~/.gaiad7
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad8) 100000000000$GAIA_DENOM --home ~/.gaiad8
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad9) 100000000000$GAIA_DENOM --home ~/.gaiad9
gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test --home ~/.gaiad10) 100000000000$GAIA_DENOM --home ~/.gaiad10

#sterss Recipient
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad1
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad2
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad3
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad4
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad5
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad6
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad7
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad8
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad9
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom --home ~/.gaiad10


#hermes
rm -r ~/.hermes/
rm MNEMONIC.key

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46
do
        cli=$(gaiad keys add hermes$i --keyring-backend test --home ~/.gaiad1 --output json | jq -r '.')
        MNEMONIC=$(echo $cli | jq -r '.mnemonic')
        echo -n "\"$MNEMONIC\"," >> MNEMONIC.key
        gaiada1=$(echo $cli | jq -r '.address')
        gaiada2=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad2 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada3=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad3 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada4=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad4 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada5=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad5 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada6=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad6 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada7=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad7 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada8=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad8 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada9=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad9 --recover --keyring-backend test --output json| jq -r '.address')
        gaiada10=$(echo "$MNEMONIC" | gaiad keys add hermes$i --home ~/.gaiad10 --recover --keyring-backend test --output json| jq -r '.address')
 
        hermes -c hermes-config/config$i.toml keys restore gaiad1 -m "$MNEMONIC" -n test$i 
        hermes -c hermes-config/config$i.toml keys restore gaiad2 -m "$MNEMONIC" -n test$i
        hermes -c hermes-config/config$i.toml keys restore gaiad3 -m "$MNEMONIC" -n test$i 
        hermes -c hermes-config/config$i.toml keys restore gaiad3 -m "$MNEMONIC" -n test$i 
        hermes -c hermes-config/config$i.toml keys restore gaiad4 -m "$MNEMONIC" -n test$i 
        hermes -c hermes-config/config$i.toml keys restore gaiad5 -m "$MNEMONIC" -n test$i 
        hermes -c hermes-config/config$i.toml keys restore gaiad6 -m "$MNEMONIC" -n test$i 
        hermes -c hermes-config/config$i.toml keys restore gaiad7 -m "$MNEMONIC" -n test$i 
        hermes -c hermes-config/config$i.toml keys restore gaiad8 -m "$MNEMONIC" -n test$i
        hermes -c hermes-config/config$i.toml keys restore gaiad9 -m "$MNEMONIC" -n test$i
        hermes -c hermes-config/config$i.toml keys restore gaiad10 -m "$MNEMONIC" -n test$i 

        gaiad add-genesis-account $gaiada1 1000000000000uatom --home ~/.gaiad1
        gaiad add-genesis-account $gaiada2 1000000000000uatom --home ~/.gaiad2
        gaiad add-genesis-account $gaiada3 1000000000000uatom --home ~/.gaiad3
        gaiad add-genesis-account $gaiada4 1000000000000uatom --home ~/.gaiad4
        gaiad add-genesis-account $gaiada5 1000000000000uatom --home ~/.gaiad5
        gaiad add-genesis-account $gaiada6 1000000000000uatom --home ~/.gaiad6
        gaiad add-genesis-account $gaiada7 1000000000000uatom --home ~/.gaiad7
        gaiad add-genesis-account $gaiada8 1000000000000uatom --home ~/.gaiad8
        gaiad add-genesis-account $gaiada9 1000000000000uatom --home ~/.gaiad9
        gaiad add-genesis-account $gaiada10 1000000000000uatom --home ~/.gaiad10
done

gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad1) --chain-id gaiad1 --keyring-backend test --home ~/.gaiad1
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad2) --chain-id gaiad2 --keyring-backend test --home ~/.gaiad2
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad3) --chain-id gaiad3 --keyring-backend test --home ~/.gaiad3
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad4) --chain-id gaiad4 --keyring-backend test --home ~/.gaiad4
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad5) --chain-id gaiad5 --keyring-backend test --home ~/.gaiad5
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad6) --chain-id gaiad6 --keyring-backend test --home ~/.gaiad6
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad7) --chain-id gaiad7 --keyring-backend test --home ~/.gaiad7
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad8) --chain-id gaiad8 --keyring-backend test --home ~/.gaiad8
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad9) --chain-id gaiad9 --keyring-backend test --home ~/.gaiad9
gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator --home ~/.gaiad10) --chain-id gaiad10 --keyring-backend test --home ~/.gaiad10

gaiad collect-gentxs --home ~/.gaiad1
gaiad collect-gentxs --home ~/.gaiad2
gaiad collect-gentxs --home ~/.gaiad3
gaiad collect-gentxs --home ~/.gaiad4
gaiad collect-gentxs --home ~/.gaiad5
gaiad collect-gentxs --home ~/.gaiad6
gaiad collect-gentxs --home ~/.gaiad7
gaiad collect-gentxs --home ~/.gaiad8
gaiad collect-gentxs --home ~/.gaiad9
gaiad collect-gentxs --home ~/.gaiad10

rm ~/.gaiad1/config/config.toml
rm ~/.gaiad2/config/config.toml
rm ~/.gaiad3/config/config.toml
rm ~/.gaiad4/config/config.toml
rm ~/.gaiad5/config/config.toml
rm ~/.gaiad6/config/config.toml
rm ~/.gaiad7/config/config.toml
rm ~/.gaiad8/config/config.toml
rm ~/.gaiad9/config/config.toml
rm ~/.gaiad10/config/config.toml

rm ~/.gaiad1/config/app.toml
rm ~/.gaiad2/config/app.toml
rm ~/.gaiad3/config/app.toml
rm ~/.gaiad4/config/app.toml
rm ~/.gaiad5/config/app.toml
rm ~/.gaiad6/config/app.toml
rm ~/.gaiad7/config/app.toml
rm ~/.gaiad8/config/app.toml
rm ~/.gaiad9/config/app.toml
rm ~/.gaiad10/config/app.toml

cp chains-config/gaia1/* ~/.gaiad1/config/
cp chains-config/gaia2/* ~/.gaiad2/config/
cp chains-config/gaia3/* ~/.gaiad3/config/
cp chains-config/gaia4/* ~/.gaiad4/config/
cp chains-config/gaia5/* ~/.gaiad5/config/
cp chains-config/gaia6/* ~/.gaiad6/config/
cp chains-config/gaia7/* ~/.gaiad7/config/
cp chains-config/gaia8/* ~/.gaiad8/config/
cp chains-config/gaia9/* ~/.gaiad9/config/
cp chains-config/gaia10/* ~/.gaiad10/config/

export USERNAME=$(whoami)
sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad1.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad1.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad1
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad2.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad2.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad2
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad3.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad3.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad3
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad4.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad4.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad4
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad5.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad5.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad5
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad6.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad6.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad6
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad7.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad7.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad7
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad8.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad8.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad8
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad9.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad9.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad9
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad10.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad10.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start --home $HOME/.gaiad10
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo systemctl enable gaiad1
sudo systemctl enable gaiad2
sudo systemctl enable gaiad3
sudo systemctl enable gaiad4
sudo systemctl enable gaiad5
sudo systemctl enable gaiad6
sudo systemctl enable gaiad7
sudo systemctl enable gaiad8
sudo systemctl enable gaiad9
sudo systemctl enable gaiad10

sudo systemctl start gaiad1
sudo systemctl start gaiad2
sudo systemctl start gaiad3
sudo systemctl start gaiad4
sudo systemctl start gaiad5
sudo systemctl start gaiad6
sudo systemctl start gaiad7
sudo systemctl start gaiad8
sudo systemctl start gaiad9
sudo systemctl start gaiad10

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