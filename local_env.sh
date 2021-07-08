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

#cosmos-sdk v0.43.0-beta1
git clone https://github.com/terra-money/core
cd core
git pull
git checkout v0.5.0-beta4
make install
cd ..
rm -r core

#cosmos-sdk v0.42.4
git clone https://github.com/irisnet/irishub
cd irishub
git pull
git checkout v1.1.1
make install
cd ..
rm -r irishub
#cosmos-sdk v0.42.4
git clone https://github.com/bandprotocol/chain
cd chain
git pull
git checkout v2.0.3
make install
cd ..
rm -r chain

#cosmos-sdk v0.42.5
git clone https://github.com/osmosis-labs/osmosis
cd osmosis/
git pull
git checkout v2.0.0-rc0
make install
cd ..
rm -r osmosis

#cosmos-sdk v0.42.5
git clone https://github.com/sentinel-official/hub
cd hub/
git pull
git checkout v0.7.0
make install
cd ..
rm -r hub

#cosmos-sdk v0.42.4-regen-1
git clone https://github.com/regen-network/regen-ledger
cd regen-ledger/
git pull
git checkout v1.0.0
make install
cd ..
rm -r regen-ledger/

#cosmos-sdk 
git clone https://github.com/ovrclk/akash
cd akash/
git pull
git checkout v0.12.2-rc6
make install
cd ..
rm -r akash/

#cosmos-sdk v0.42.6
mkdir cro
cd cro
curl -LOJ https://github.com/crypto-org-chain/chain-main/releases/download/v2.1.0/chain-main_2.1.0_Linux_x86_64.tar.gz
tar -zxvf chain-main_2.1.0_Linux_x86_64.tar.gz
sudo chmod +x bin/chain-maind
mv bin/chain-maind ~/goApps/bin/
cd ..
rm -r cro

#cosmos-sdk v0.42.4
git clone https://github.com/persistenceOne/persistenceCore
cd persistenceCore/
git pull
git checkout v0.1.3
make install
cd ..
rm -r persistenceCore/

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

sudo rm -r ~/.gaia/
sudo rm -r ~/.terra/
sudo rm -r ~/.osmosisd/
sudo rm -r ~/.band/
sudo rm -r ~/.iris/
sudo rm -r ~/.sentinelhub/
sudo rm -r ~/.regen/
sudo rm -r ~/.akash/
sudo rm -r ~/.chain-maind/
sudo rm -r ~/.persistenceCore/

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

gaiad init test --chain-id gaia
bandd init test --chain-id band
terrad init test --chain-id terra
osmosisd init test --chain-id osmo
iris init test --chain-id iris
sentinelhub init test --chain-id sentinelhub
regen init test --chain-id regen
akash init test --chain-id akash
chain-maind init test --chain-id cro
persistenceCore init test --chain-id persistenceCore

rm ~/.sentinelhub/config/genesis.json
cp chains-config/sentinelhub/genesis.json ~/.sentinelhub/config/genesis.json

export WALLET_NAME_VALIDATOR=validator

gaiad keys add $WALLET_NAME_VALIDATOR --keyring-backend test
bandd keys add $WALLET_NAME_VALIDATOR --keyring-backend test
osmosisd keys add $WALLET_NAME_VALIDATOR --keyring-backend test
terrad keys add $WALLET_NAME_VALIDATOR --keyring-backend test
iris keys add $WALLET_NAME_VALIDATOR --keyring-backend test
sentinelhub keys add $WALLET_NAME_VALIDATOR --keyring-backend test
regen keys add $WALLET_NAME_VALIDATOR --keyring-backend test
akash keys add $WALLET_NAME_VALIDATOR --keyring-backend test
chain-maind keys add $WALLET_NAME_VALIDATOR --keyring-backend test
persistenceCore keys add $WALLET_NAME_VALIDATOR --keyring-backend test

export GAIA_DENOM=$(cat ~/.gaia/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export BAND_DENOM=$(cat ~/.band/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export TERRA_DENOM=$(cat ~/.terra/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export OSMO_DENOM=$(cat ~/.osmosisd/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export IRIS_DENOM=$(cat ~/.iris/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export SENTINELHUB_DENOM=$(cat ~/.sentinelhub/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export REGEN_DENOM=$(cat ~/.regen/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export AKASH_DENOM=$(cat ~/.akash/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export CRO_DENOM=$(cat ~/.chain-maind/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')
export PERSISTENCECORE_DENOM=$(cat ~/.persistenceCore/config/genesis.json | jq -r '.app_state.staking.params.bond_denom')

gaiad add-genesis-account $(gaiad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$GAIA_DENOM
bandd add-genesis-account $(bandd keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$BAND_DENOM
terrad add-genesis-account $(terrad keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$TERRA_DENOM
osmosisd add-genesis-account $(osmosisd keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$OSMO_DENOM
iris add-genesis-account $(iris keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$IRIS_DENOM
sentinelhub add-genesis-account $(sentinelhub keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$SENTINELHUB_DENOM
regen add-genesis-account $(regen keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$REGEN_DENOM
akash add-genesis-account $(akash keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$AKASH_DENOM
chain-maind add-genesis-account $(chain-maind keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$CRO_DENOM
persistenceCore add-genesis-account $(persistenceCore keys show $WALLET_NAME_VALIDATOR -a --bech acc --keyring-backend test) 100000000000$PERSISTENCECORE_DENOM

#sterss Recipient
gaiad add-genesis-account cosmos18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6gxhe8c 1000000000000uatom
bandd add-genesis-account band1dn94fk7ul6gj7dprdnw7ufvepmkwaun7tn8n4t 1000000000000uband
terrad add-genesis-account terra17pdf2zxfcuclavl7874tjwuk89aga06h8uqzxz 100000000000uluna
osmosisd add-genesis-account osmo18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6qayf32 1000000000000uosmo
iris add-genesis-account iaa18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6ayhg9f 1000000000000uiris
sentinelhub add-genesis-account sent18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6napqrh 1000000000000udvpn
regen add-genesis-account regen18zh6zd2kwtekjeg0ns5xvn2x28hgj8n6hyu93u 1000000000000uregen
akash add-genesis-account akash18zh6zd2kwtekjeg0ns5xvn2x28hgj8n69a677z 1000000000000uakt
chain-maind add-genesis-account cro1jhn9z0q0t3872kw7hkuz40yx5rj5hmhrf6u0pp 1000000000000ucro
persistenceCore add-genesis-account persistence1qj57lazgwmmnnnthfajl4r0xfsrz02eknn9gz6 1000000000000uxprt

#hermes
rm -r ~/.hermes/


for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46
do
        cli=$(gaiad keys add hermes$i --keyring-backend test --output json | jq -r '.')
        MNEMONIC=$(echo $cli | jq -r '.mnemonic')
        echo "$MNEMONIC" >> MNEMONIC.key
        gaiada=$(echo $cli | jq -r '.address')
        bandda=$(echo "$MNEMONIC" | bandd keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        terrada=$(echo "$MNEMONIC" | terrad keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        osmosisda=$(echo "$MNEMONIC" | osmosisd keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        irisa=$(echo "$MNEMONIC" | iris keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        sentinelhuba=$(echo "$MNEMONIC" | sentinelhub keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        regena=$(echo "$MNEMONIC" | regen keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        akasha=$(echo "$MNEMONIC" | akash keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        chainmainda=$(echo "$MNEMONIC" | chain-maind keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
        persistenceCorea=$(echo "$MNEMONIC" | persistenceCore keys add hermes$i --recover --keyring-backend test --output json| jq -r '.address'&)
 
        hermes -c hermes-config/config$i.toml keys restore gaia -m "$MNEMONIC" -n test$i &
        hermes -c hermes-config/config$i.toml keys restore band -m "$MNEMONIC" -n test$i  -p "m/44'/494'/0'/0/0" &
        hermes -c hermes-config/config$i.toml keys restore terra -m "$MNEMONIC" -n test$i -p "m/44'/330'/0'/0/0" &
        hermes -c hermes-config/config$i.toml keys restore osmo -m "$MNEMONIC" -n test$i &
        hermes -c hermes-config/config$i.toml keys restore iris -m "$MNEMONIC" -n test$i &
        hermes -c hermes-config/config$i.toml keys restore sentinelhub -m "$MNEMONIC" -n test$i &
        hermes -c hermes-config/config$i.toml keys restore regen -m "$MNEMONIC" -n test$i &
        hermes -c hermes-config/config$i.toml keys restore akash -m "$MNEMONIC" -n test$i &
        hermes -c hermes-config/config$i.toml keys restore cro -m "$MNEMONIC" -n test$i  -p "m/44'/394'/0'/0/0" &
        hermes -c hermes-config/config$i.toml keys restore persistenceCore -m "$MNEMONIC" -n test$i -p "m/44'/750'/0'/0/0" &

        gaiad add-genesis-account $gaiada 1000000000000uatom&
        bandd add-genesis-account $bandda 1000000000000uband&
        terrad add-genesis-account $terrada 100000000000uluna&
        osmosisd add-genesis-account $osmosisda 1000000000000uosmo&
        iris add-genesis-account $irisa 1000000000000uiris&
        sentinelhub add-genesis-account $sentinelhuba 1000000000000udvpn&
        regen add-genesis-account $regena 1000000000000uregen&
        akash add-genesis-account $akasha 1000000000000uakt&
        chain-maind add-genesis-account $chainmainda 1000000000000ucro&
        persistenceCore add-genesis-account $persistenceCorea 1000000000000uxprt&
done

gaiad gentx $WALLET_NAME_VALIDATOR 100000000$GAIA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(gaiad tendermint show-validator) --chain-id gaia --keyring-backend test
bandd gentx $WALLET_NAME_VALIDATOR 100000000$BAND_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(bandd tendermint show-validator) --chain-id band --keyring-backend test
terrad gentx $WALLET_NAME_VALIDATOR 100000000$TERRA_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --chain-id terra --keyring-backend test
osmosisd gentx $WALLET_NAME_VALIDATOR 100000000$OSMO_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(osmosisd tendermint show-validator) --chain-id osmo --keyring-backend test
iris gentx $WALLET_NAME_VALIDATOR 100000000$IRIS_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(iris tendermint show-validator) --chain-id iris --keyring-backend test
sentinelhub gentx $WALLET_NAME_VALIDATOR 100000000$SENTINELHUB_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(sentinelhub tendermint show-validator) --chain-id sentinelhub --keyring-backend test
regen gentx $WALLET_NAME_VALIDATOR 100000000$REGEN_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(regen tendermint show-validator) --chain-id regen --keyring-backend test
akash gentx $WALLET_NAME_VALIDATOR 100000000$AKASH_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(akash tendermint show-validator) --chain-id akash --keyring-backend test
chain-maind gentx $WALLET_NAME_VALIDATOR 100000000$CRO_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(chain-maind tendermint show-validator) --chain-id cro --keyring-backend test
persistenceCore gentx $WALLET_NAME_VALIDATOR 100000000$PERSISTENCECORE_DENOM --commission-max-change-rate 1 --commission-max-rate 1  --commission-rate 1 --min-self-delegation 1 --pubkey=$(persistenceCore tendermint show-validator) --chain-id persistenceCore --keyring-backend test

gaiad collect-gentxs
bandd collect-gentxs
terrad collect-gentxs
osmosisd  collect-gentxs
iris collect-gentxs
sentinelhub collect-gentxs
regen collect-gentxs
akash collect-gentxs
chain-maind collect-gentxs
persistenceCore collect-gentxs

rm ~/.gaia/config/config.toml
rm ~/.band/config/config.toml
rm ~/.terra/config/config.toml
rm ~/.osmosisd/config/config.toml
rm ~/.iris/config/config.toml
rm ~/.sentinelhub/config/config.toml
rm ~/.regen/config/config.toml
rm ~/.akash/config/config.toml
rm ~/.chain-maind/config/config.toml
rm ~/.persistenceCore/config/config.toml

rm ~/.gaia/config/app.toml
rm ~/.band/config/app.toml
rm ~/.terra/config/app.toml
rm ~/.osmosisd/config/app.toml
rm ~/.iris/config/app.toml
rm ~/.sentinelhub/config/app.toml
rm ~/.regen/config/app.toml
rm ~/.akash/config/app.toml
rm ~/.chain-maind/config/app.toml
rm ~/.persistenceCore/config/app.toml

cp chains-config/gaia/* ~/.gaia/config/
cp chains-config/band/* ~/.band/config/
cp chains-config/terra/* ~/.terra/config/
cp chains-config/osmo/* ~/.osmosisd/config/
cp chains-config/iris/* ~/.iris/config/
cp chains-config/sentinelhub/app.toml ~/.sentinelhub/config/
cp chains-config/sentinelhub/config.toml ~/.sentinelhub/config/
cp chains-config/regen/* ~/.regen/config/
cp chains-config/akash/* ~/.akash/config/
cp chains-config/cro/* ~/.chain-maind/config/
cp chains-config/persistenceCore/* ~/.persistenceCore/config/

export USERNAME=$(whoami)
sudo -E bash -c 'cat << EOF > /etc/systemd/system/gaiad.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=gaiad.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/gaiad start
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
Requires=bandd.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/bandd start
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
Requires=terrad.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/terrad start
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
Requires=iris.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/iris start
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
Requires=osmosisd.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/osmosisd start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/sentinelhub.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=sentinelhub.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/sentinelhub start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/regen.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=regen.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/regen start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/akash.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=akash.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/akash start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/cro.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=cro.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/chain-maind start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'

sudo -E bash -c 'cat << EOF > /etc/systemd/system/persistenceCore.service
[Unit]
Description=Node Daemon
After=network-online.target
Requires=persistenceCore.service

[Service]
User=$USERNAME
ExecStart=$HOME/goApps/bin/persistenceCore start
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
sudo systemctl enable sentinelhub
sudo systemctl enable regen
sudo systemctl enable akash
sudo systemctl enable cro
sudo systemctl enable persistenceCore

sudo systemctl start gaiad
sudo systemctl start bandd
sudo systemctl start terrad
sudo systemctl start iris
sudo systemctl start osmosisd
sudo systemctl start sentinelhub
sudo systemctl start regen
sudo systemctl start akash
sudo systemctl start cro
sudo systemctl start persistenceCore

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