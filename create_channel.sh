hermes -c hermes-config/config2.toml create channel gaia band --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config3.toml create channel gaia terra --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config4.toml create channel gaia osmo --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config5.toml create channel gaia iris --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config6.toml create channel gaia sentinelhub --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config7.toml create channel gaia regen --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config8.toml create channel gaia akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config9.toml create channel gaia cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config10.toml create channel gaia persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config11.toml create channel band terra --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config12.toml create channel band osmo --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config13.toml create channel band iris --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config14.toml create channel band sentinelhub --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config15.toml create channel band regen --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config16.toml create channel band akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config17.toml create channel band cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config18.toml create channel band persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config19.toml create channel terra osmo --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config20.toml create channel terra iris --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config21.toml create channel terra sentinelhub --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config22.toml create channel terra regen --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config23.toml create channel terra akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config24.toml create channel terra cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config25.toml create channel terra persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config26.toml create channel osmo iris --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config27.toml create channel osmo sentinelhub --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config28.toml create channel osmo regen --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config29.toml create channel osmo akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config30.toml create channel osmo cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config31.toml create channel osmo persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config32.toml create channel iris sentinelhub --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config33.toml create channel iris regen --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config34.toml create channel iris akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config35.toml create channel iris cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config36.toml create channel iris persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config37.toml create channel sentinelhub regen --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config38.toml create channel sentinelhub akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config39.toml create channel sentinelhub cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config40.toml create channel sentinelhub persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config41.toml create channel regen akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config42.toml create channel regen cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config43.toml create channel regen persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config44.toml create channel akash cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config45.toml create channel akash persistenceCore --port-a transfer --port-b transfer -o unordered&

hermes -c hermes-config/config46.toml create channel cro persistenceCore --port-a transfer --port-b transfer -o unordered

hermes -c hermes-config/config1.toml -j query clients gaia | jq
hermes -c hermes-config/config1.toml -j query connections gaia | jq
hermes -c hermes-config/config1.toml -j query channels gaia | jq

hermes -c hermes-config/config1.toml -j query clients band | jq
hermes -c hermes-config/config1.toml -j query channels band | jq
hermes -c hermes-config/config1.toml -j query connections band | jq

hermes -c hermes-config/config1.toml -j query clients terra | jq
hermes -c hermes-config/config1.toml -j query channels terra | jq
hermes -c hermes-config/config1.toml -j query connections terra | jq

hermes -c hermes-config/config1.toml -j query clients osmo | jq
hermes -c hermes-config/config1.toml -j query channels osmo | jq
hermes -c hermes-config/config1.toml -j query connections osmo | jq

hermes -c hermes-config/config1.toml -j query clients iris | jq
hermes -c hermes-config/config1.toml -j query channels iris | jq
hermes -c hermes-config/config1.toml -j query connections iris | jq

hermes -c hermes-config/config1.toml -j query clients sentinelhub | jq
hermes -c hermes-config/config1.toml -j query channels sentinelhub | jq
hermes -c hermes-config/config1.toml -j query connections sentinelhub | jq

hermes -c hermes-config/config1.toml -j query clients regen | jq
hermes -c hermes-config/config1.toml -j query channels regen | jq
hermes -c hermes-config/config1.toml -j query connections regen | jq

hermes -c hermes-config/config1.toml -j query clients akash | jq
hermes -c hermes-config/config1.toml -j query channels akash | jq
hermes -c hermes-config/config1.toml -j query connections akash | jq

hermes -c hermes-config/config1.toml -j query clients cro | jq
hermes -c hermes-config/config1.toml -j query channels cro | jq
hermes -c hermes-config/config1.toml -j query connections cro | jq

hermes -c hermes-config/config1.toml -j query clients persistenceCore | jq
hermes -c hermes-config/config1.toml -j query channels persistenceCore | jq
hermes -c hermes-config/config1.toml -j query connections persistenceCore | jq

hermes -c hermes-config/config1.toml -j query channel end terra transfer channel-0 | jq

hermes -c hermes-config/config1.toml -j query channel end sentinelhub transfer channel-2 | jq

# clients(clientid,chainid maping) -> clientid connections query ( clientid, chainid, connectid mapping) -> connectionid channels query ( clientid, chainid, connectid,channelid mapping)
hermes -c hermes-config/config1.toml -j query clients gaia | jq
hermes -c hermes-config/config1.toml -j query client connections gaia 07-tendermint-2|  jq '.result'
hermes -c hermes-config/config1.toml -j query connection channels gaia connection-2 | jq '.result'

hermes -c hermes-config/config1.toml -j query client state gaia 07-tendermint-2 | jq '.result.chain_id'
hermes -c hermes-config/config1.toml -j query connection end gaia connection-2 | jq
hermes -c hermes-config/config1.toml -j query channel end gaia transfer channel-0 | jq


num=$(grpcurl -plaintext -import-path ./proto -import-path ./third_party/proto -proto ./proto/ibc/core/client/v1/query.proto localhost:9090 ibc.core.client.v1.Query/ClientStates | jq '.clientStates |  length')
for ((i=0; i< $num; i++));
do
    client=$(grpcurl -plaintext -import-path ./proto -import-path ./third_party/proto -proto ./proto/ibc/core/client/v1/query.proto localhost:9090 ibc.core.client.v1.Query/ClientStates | jq -r '.clientStates | .['$i'].clientId')
    name=$(gaiad q ibc client states -o json | jq -r '.client_states | .['$i'].client_state.chain_id')
    connect=$(grpcurl -plaintext -import-path ./proto -import-path ./third_party/proto -proto ./proto/ibc/core/connection/v1/query.proto -d '{"client_id":"'$client'"}' localhost:9090 ibc.core.connection.v1.Query/ClientConnections | jq -r '.connectionPaths | .[0]')
    channel=$(grpcurl -plaintext -import-path ./proto -import-path ./third_party/proto -proto ./proto/ibc/core/channel/v1/query.proto -d '{"connection":"'$connect'"}' localhost:9090 ibc.core.channel.v1.Query/ConnectionChannels | jq -r '.channels | .[].channelId')
    echo "$name:$channel"
done


gaiad q ibc client states -o json | jq '.client_states | .[2].client_id' #07-tendermint-2
gaiad q ibc client states -o json | jq '.client_states | .[2].client_state.chain_id' #terra
gaiad q ibc connection path 07-tendermint-2 -o json | jq '.connection_paths | .[0]' #connection-1
gaiad q ibc channel connections connection-1 -o json | jq '.channels | .[].channel_id' #channel-2      counterparty : dst chain chan
grpcurl -plaintext -import-path ./proto -import-path ./third_party/proto -proto ./proto/ibc/core/client/v1/query.proto localhost:9090 ibc.core.client.v1.Query/ClientStates | jq '.clientStates | .[2].clientId'