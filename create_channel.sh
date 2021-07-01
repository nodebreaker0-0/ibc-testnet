hermes -c hermes-config/config.toml create channel gaia iris --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel iris gaia --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel gaia osmo --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel osmo gaia --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel iris osmo --port-a transfer --port-b transfer -o unordered
hermes -c hermes-config/config.toml create channel osmo iris --port-a transfer --port-b transfer -o unordered

hermes -c hermes-config/config.toml start