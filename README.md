# 🔐 Phase Environment Generate Action

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/anilrajrimal1/phase-env-generate-action)](https://github.com/anilrajrimal1/phase-env-generate-action/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A GitHub Action that fetches secrets from [Phase](https://phase.dev) and generates a `.env` file for your projects.

## Overview

This action automates the process of retrieving secrets from Phase and creating a `.env` file, making it easy to incorporate secure environment variables into your GitHub Actions workflow.

## Features

- 🔒 Securely authenticates with Phase using your access token
- 📥 Fetches secrets from your Phase environment
- 📝 Generates a `.env` file with your secrets
- 🔄 Simple integration with existing workflows

## Usage

### Prerequisites

- A [Phase](https://phase.dev) account with secrets configured
- A Phase access token with appropriate permissions

### Basic Example

```yaml
name: Deploy with Phase Secrets

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Fetch Phase Secrets and generate .env
        uses: anilrajrimal1/phase-env-generate-action@v1.0.0
        with:
          phase_access_token: ${{ secrets.PHASE_ACCESS_TOKEN }}
      
      # Your .env file is now available for other steps
      - name: Run your application
        run: |
          docker compose up -d --build
```

### Inputs

| Input                | Description                | Required |
|----------------------|----------------------------|----------|
| `phase_access_token` | Your Phase API access token| ✅ Yes   |

### Outputs

| Output     | Description                    | Value  |
|------------|--------------------------------|--------|
| `env_file` | Path to the generated .env file| `.env` |

## Security Notes

- Store your Phase access token as a GitHub secret
- Never hardcode your access token in workflow files
- The action uses secure methods to authenticate with Phase

## How It Works

1. The action installs the Phase CLI
2. Authenticates with Phase using your access token
3. Fetches your secrets from Phase
4. Writes them to a `.env` file at the root of your repository

## Requirements

- GitHub Actions runner with bash support

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨Author

Anil Raj Rimal

## 🙏 Acknowledgements

- [Phase](https://phase.dev) for providing the secrets management platform.