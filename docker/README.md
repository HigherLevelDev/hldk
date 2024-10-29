# Docker Services

This directory contains Docker configurations for various services used by the HigherLevelDevKit.

## ChromaDB

The `docker-compose.yml` file includes configuration for running ChromaDB, a vector database used for storing and retrieving embeddings.

### Usage

To start ChromaDB:

```bash
cd docker
docker compose up -d hldk
```

This will start ChromaDB on port 8000. The service data is persisted using a named volume `hldk_chroma_data`.

### Configuration

- Port: 8000
- Persistence: Data is stored in the `hldk_chroma_data` volume
- Telemetry: Disabled
- Allow Reset: Enabled (for development purposes)