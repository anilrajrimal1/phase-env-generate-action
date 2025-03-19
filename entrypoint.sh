#!/bin/bash
set -e

echo "Fetching secrets from Phase..."
phase secrets pull --format=dotenv > .env

echo "Secrets saved to .env file:"