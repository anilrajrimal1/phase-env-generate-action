# 🔐 Phase Secrets Fetch Action

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/anilrajrimal1/phase-secrets-fetch-action)](https://github.com/anilrajrimal1/phase-secrets-fetch-action/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A GitHub Action that securely fetches secrets from [Phase](https://phase.dev) and generates a `.env` file for use in your workflows.

## Overview

This action automates retrieving secrets from Phase and writing them to a `.env` file, making it easy to integrate secure environment variables into your GitHub Actions workflows.

## Features

- 🔒 Secure authentication using a Phase Service Token
- 📥 Fetches secrets for a specified Phase environment
- 📝 Writes secrets to a `.env` file for seamless use in subsequent steps
- ⚡ Simple setup and integration with GitHub Actions

## Usage

### Prerequisites

- A [Phase](https://phase.dev) account with configured secrets or your own Self-Hosted one.
- A Phase Service Token with appropriate permissions

### Basic Example

```yaml
name: Deploy with Phase Secrets

on:
  push:
    branches: [ master ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Fetch Phase Secrets and generate .env
        uses: anilrajrimal1/phase-secrets-fetch-action@v1.0.2
        with:
          phase_service_token: ${{ secrets.PHASE_SERVICE_TOKEN }}
          phase_app_name: "your-phase-app-name"
          phase_env: "your-env"
      
      # Your .env file is now available for other steps
      - name: Run your application
        run: |
          docker compose up -d --build
```

### Inputs

| Input                | Description                                         | Required |
|----------------------|-----------------------------------------------------|----------|
| `phase_service_token` | Your Phase Service Token                           | ✅ Yes   |
| `phase_app_name`     | The name of your Phase application                  | ✅ Yes   |
| `phase_env`         | The environment (e.g., develop, staging, production) | ✅ Yes   |
| `phase_host`        | Phase host URL (only for self-hosted instances)      | ❌ No    |
| `output_file`       | Path to save the `.env` file (default: `.env`)       | ❌ No    |
| `secrets_to_fetch`  | Space-separated list of specific secrets to fetch    | ❌ No    |

### Outputs

| Output     | Description                     | Value  |
|------------|---------------------------------|--------|
| `env_file` | Path to the generated `.env` file | `.env` |

## Security Notes

- Store your `PHASE_SERVICE_TOKEN` as a GitHub Secret.
- Never hardcode secrets in workflow files.
- The action securely fetches secrets using Phase CLI.

## How It Works

1. The action installs the Phase CLI.
2. Exports necessary environment variables for authentication.
3. Fetches all secrets for the given application and environment.
4. Writes them to a `.env` file.

## Requirements

- GitHub Actions runner with bash support

## Contributing

Contributions are welcome! Feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨 Author

Anil Raj Rimal

## 🙏 Acknowledgements

- [Phase](https://phase.dev) for providing a robust secrets management platform.

