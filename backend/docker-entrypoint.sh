#!/bin/sh
set -e

echo "Starting backend application..."

# Wait for database to be ready
echo "Waiting for database to be ready..."
until nc -z db 5432; do
  echo "Database is unavailable - sleeping"
  sleep 1
done

echo "Database is up - executing command"

# Run database migrations
echo "Running database migrations..."
npx prisma migrate deploy

# Generate Prisma client
echo "Generating Prisma client..."
npx prisma generate

# Start the application
echo "Starting the application..."
exec "$@"
