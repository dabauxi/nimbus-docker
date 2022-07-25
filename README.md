# Nimbus Docker

Provides a `docker-compose` environment for running Nimbus. This repository is inspired by [lighthouse-docker](https://github.com/sigp/lighthouse-docker) from sigp.

The following features are available:

- Nimbus beacon node and validator.
- Nethermind execution client.

## Usage

`$ docker-compose up`

A `.nimbus` directory will be created in the repository root (if not specified otherwise) which contains the beacon node database and other Nimbus files.

Further a `.nethermind` directory will be created in the repository root (if not specified otherwise) which contains the execution client database.

## Configuration

### Environment file
The docker-compose file requires that a `.env` file be present in this
directory. The `default.env` file provides a template and can be copied `.env`:

```bash
$ cp default.env .env
```

Failure to create an `.env` file will result in the following error:

```
ERROR: Couldn't find env file: /home/username/nimbus-docker/.env
```

### Data directories
The data directories for Nimbus and Nethermind need to be created before starting the services. This can be done by executing:

```bash
# Elevated priviliges are needed to set correct ownership and permissions.
$ sudo ./create-data-directories.sh $(whoami)
```
