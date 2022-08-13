# Nimbus Docker

## How to use

1. First create data directories. This can be done by executing:
```bash
# Elevated priviliges are needed to set correct ownership and permissions.
$ sudo ./create-data-directories.sh $(whoami)
```
2. Configure the clients via a `.env` file. Simply copy the `default.env` to a `.env`
```bash
$ cp default.env .env
```
3. Generate a JWT secret for authentication between the beacon and execution node.

```bash
$ openssl rand -hex 32 | tr -d "\n" > ./secrets/jwtsecret
```
4. Import your validator keys when deciding to run a validator. 
This can be done by placing your validator keys in the `validator_keys/` directory and execute:
```bash
# You'll be asked to enter the password you created to encrypt your keystore(s).
$ ./import-validator-keys.sh
```
5. (Optionally) Start trusted node sync (uses the URL from your .env) by executing:
```bash
# You'll be asked to enter the password you created to encrypt your keystore(s).
$ ./init-trusted-node-sync.sh
```
6. Start by running:
```bash
$ docker-compose up -d
```