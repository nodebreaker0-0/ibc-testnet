hermes -c hermes-config/config2.toml create channel gaia band --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config3.toml create channel gaia terra --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config4.toml create channel gaia osmo --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config5.toml create channel gaia iris --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config6.toml create channel gaia sentinelhub --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config7.toml create channel gaia regen --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config8.toml create channel gaia akash --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config9.toml create channel gaia cro --port-a transfer --port-b transfer -o unordered&
hermes -c hermes-config/config10.toml create channel gaia persistenceCore --port-a transfer --port-b transfer -o unordered

hermes -c hermes-config/config1.toml -j query clients gaia | jq
hermes -c hermes-config/config1.toml -j query channels gaia | jq
hermes -c hermes-config/config1.toml -j query connections gaia | jq

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
