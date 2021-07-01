cd ibc-rs/
git pull
git checkout v0.5.0
sudo apt install libssl-dev
sudo apt install pkg-config
cargo install ibc-relayer-cli --bin hermes --locked
cd ..

#cosmos-sdk v0.42.6
cd chain-git/gaia/
git pull
git checkout v5.0.0
make install
cd ..

#cosmos-sdk v0.43.0-beta1
cd chain-git/core/
git pull
git checkout v0.5.0-beta4
make install
cd ..

#cosmos-sdk v0.42.4
cd chain-git/irishub/
git pull
git checkout v1.1.1
make install
cd ..

#cosmos-sdk v0.42.4
cd chain-git/chain/
git pull
git checkout v2.0.3
make install
cd ..

#cosmos-sdk v0.42.5
cd chain-git/osmosis/
git pull
git checkout v2.0.0-rc0
make install
cd ..

export WALLET_NAME_VALIDATOR=validator 

sudo rm -r ~/.gaia/
sudo rm -r ~/.terra/
sudo rm -r ~/.osmosisd/
sudo rm -r ~/.band/
sudo rm -r ~/.iris/

gaiad init test --chain-id gaia
bandd init test --chain-id band
terrad init test --chain-id terra
osmosisd init test --chain-id osmo
iris init test --chain-id iris

gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test
bandd keys add $WALLET_NAME_VALIDATOR --keyring-backend test
osmosisd keys add $WALLET_NAME_VALIDATOR --keyring-backend test
terrad keys add $WALLET_NAME_VALIDATOR --keyring-backend test
iris keys add $WALLET_NAME_VALIDATOR --keyring-backend test

export GAIA_DENOM=$(cat ~/.gaia/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export BAND_DENOM=$(cat ~/.band/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export TERRA_DENOM=$(cat ~/.terra/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export OSMO_DENOM=$(cat ~/.osmosisd/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export IRIS_DENOM=$(cat ~/.iris/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')

gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$GAIA_DENOM
bandd add-genesis-account $(bandd keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$BAND_DENOM
terrad add-genesis-account $(terrad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$TERRA_DENOM
osmosisd add-genesis-account $(osmosisd keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$OSMO_DENOM
iris add-genesis-account $(iris keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$IRIS_DENOM

#sterss tester
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom
bandd add-genesis-account band1dn94fk7ul6gj7dprdnw7ufvepmkwaun7tn8n4t 1000000000000uband
terrad add-genesis-account terra17pdf2zxfcuclavl7874tjwuk89aga06h8uqzxz 100000000000uluna
osmosisd add-genesis-account osmo18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6qayf32 1000000000000uosmo
iris add-genesis-account iaa18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6ayhg9f 1000000000000uiris

#hermes
gaiad add-genesis-account cosmos1jgldgxzjyzxygr8vtmfhwpn7raz3a42zt9rq72 1000000000000uatom
bandd add-genesis-account band130z65arllqurj5e62pvjmemgch56twatlxwdlp 1000000000000uband
terrad add-genesis-account terra1r8jjyrqg5jra6m6zw24yzphlkxyttnf5w8jey7 100000000000uluna
osmosisd add-genesis-account osmo1jgldgxzjyzxygr8vtmfhwpn7raz3a42zr7ssgc 1000000000000uosmo
iris add-genesis-account iaa1jgldgxzjyzxygr8vtmfhwpn7raz3a42z78r3um 1000000000000uiris

gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator) --chain-id gaia --keyring-backend test
bandd gentx $WALLET_NAME_VALIDATOR 100000000$BAND_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(bandd tendermint show-validator) --chain-id band --keyring-backend test
terrad gentx $WALLET_NAME_VALIDATOR 100000000$TERRA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(terrad tendermint show-validator) --chain-id terra --keyring-backend test
osmosisd gentx $WALLET_NAME_VALIDATOR 100000000$OSMO_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(osmosisd tendermint show-validator) --chain-id osmo --keyring-backend test
iris gentx $WALLET_NAME_VALIDATOR 100000000$IRIS_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(iris tendermint show-validator) --chain-id iris --keyring-backend test

gaiad collect-gentxs
bandd collect-gentxs
terrad collect-gentxs
osmosisd  collect-gentxs
iris collect-gentxs

rm ~/.gaia/config/config.toml
rm ~/.band/config/config.toml
rm ~/.terra/config/config.toml
rm ~/.osmosisd/config/config.toml
rm ~/.iris/config/config.toml

rm ~/.gaia/config/app.toml
rm ~/.band/config/app.toml
rm ~/.terra/config/app.toml
rm ~/.osmosisd/config/app.toml
rm ~/.iris/config/app.toml

cp chains-config/gaia/* ~/.gaia/config/
cp chains-config/band/* ~/.band/config/
cp chains-config/terra/* ~/.terra/config/
cp chains-config/osmo/* ~/.osmosisd/config/
cp chains-config/iris/* ~/.iris/config/

export USERNAME=$(whoami)
sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=yoda.service

[Service]
User=ubuntu
ExecStart=/home/$USERNAME/goApps/bin/gaiad start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/bandd.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=yoda.service

[Service]
User=ubuntu
ExecStart=/home/$USERNAME/goApps/bin/bandd start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'


sudo -E bash -c 'cat << EOF > /etc/systemd/system/terrad.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=yoda.service

[Service]
User=ubuntu
ExecStart=/home/$USERNAME/goApps/bin/terrad start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/iris.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=yoda.service

[Service]
User=ubuntu
ExecStart=/home/$USERNAME/goApps/bin/iris start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/osmosisd.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=yoda.service

[Service]
User=ubuntu
ExecStart=/home/$USERNAME/goApps/bin/osmosisd start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'



sudo systemctl enable gaiad
sudo systemctl enable bandd
sudo systemctl enable terrad
sudo systemctl enable iris
sudo systemctl enable osmosisd


sudo systemctl start gaiad
sudo systemctl start bandd
sudo systemctl start terrad
sudo systemctl start iris
sudo systemctl start osmosisd


sudo rm -r ~/.hermes/
hermes -c hermes-config/config.toml keys add gaia -f hermes-config/gaia_key.json -n test
hermes -c hermes-config/config.toml keys add band -f hermes-config/band_key.json -n test  -p "m/44'/494'/0'/0/0"
hermes -c hermes-config/config.toml keys add terra -f hermes-config/terra_key.json -n test
hermes -c hermes-config/config.toml keys add osmo -f hermes-config/osmo_key.json -n test
hermes -c hermes-config/config.toml keys add iris -f hermes-config/iris_key.json -n test


hermes -c hermes-config/config.toml create channel gaia iris --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel iris gaia --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia osmo --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel osmo gaia --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel iris osmo --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel osmo iris --port-a transfer --port-b transfer -o unordered

hermes -c hermes-config/config.toml start