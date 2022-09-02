# Nimbus Docker

A validator setup using nimbus and besu which can be exectuded via docker compose.

## How to use

1. First copy the `default.env` to a `.env` and change the configuration as needed.
    ```bash
    $ cp default.env .env
    ```
2. Create data directories as specified in the `.env`. This can be done by executing:
    ```bash
    # Elevated priviliges are needed to set correct ownership and permissions.
    $ sudo ./create-data-directories.sh $(whoami)
    
    # Option 2:
    # Create data directories and set permissions manually e.g.
    # $ mkdir -p data/besu
    # $ mkdir -p data/nimbus
    # Set permissions as described in here: https://nimbus.guide/data-dir.html#permissions
    ```
3. Generate a JWT secret for authentication between the beacon and execution node.
    ```bash
    $ openssl rand -hex 32 | tr -d "\n" > ./secrets/jwtsecret
    ```
4. Import your validator keys when deciding to run a validator. 
This can be done by placing your validator keys in the `validator_keys/` directory and by executing:
    ```bash
    # You'll be asked to enter the password you created to encrypt your keystore(s).
    $ ./import-validator-keys.sh
    ```
5. Copy `nimbus-config/default-config.toml` to `nimbus-config/config.toml` and set your fee recipient address in `nimbus-config/config.toml`.

6. Copy `besu-config/default-config.toml` to `besu-config/config.toml` and set your fee recipient address in `besu-config/config.toml`.

7. (Optionally) Start trusted node sync (before set a trusted URL in `.env`) by executing:
    ```bash
    $ ./init-trusted-node-sync.sh
    ```
8. Start by running:
    ```bash
    $ docker-compose up -d
    # or the following to start without mev-boost
    # $ docker-compose up -d nimbus nethermind
    ```

## Update services

For updating services simply execute:

```bash
$ ./update.sh
# To update a specific service pass the service name.
# $ ./update.sh nimbus
```
