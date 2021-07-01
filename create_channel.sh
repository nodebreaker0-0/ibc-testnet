hermes -c hermes-config/config.toml create channel gaia band --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia terra --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia osmo --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia iris --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia sentinelhub --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia regen --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia akash --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia cro --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia persistenceCore --port-a transfer --port-b transfer -o unordered

hermes -c hermes-config/config.toml -j query clients gaia | jq

hermes -c hermes-config/config.toml start