# Overview

- Currently deployed to fly.io as v1 application

## Dependencies

- flyctl command from fly.io
- vault client

## Operation

### Creating and deploying the app

```bash
# Create the app and disk if not created yet. Run`make status` to check)
make create

# Deploying the app
make deploy
```

### Destroy the app

```bash
make destroy
```

### Check app status

```bash
make status
```

### Init and configure transit secrets engine

```bash
# init vault cluster
make init

# unseal vault cluster
make unseal

# config vault cluster
make config
```
