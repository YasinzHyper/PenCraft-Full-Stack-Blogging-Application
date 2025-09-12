# PenCraft Docker Management
.PHONY: help build up down logs clean dev prod restart

# Default target
help:
	@echo "PenCraft Docker Commands:"
	@echo ""
	@echo "  make up          - Start the application in production mode"
	@echo "  make dev         - Start the application in development mode"
	@echo "  make down        - Stop all services"
	@echo "  make build       - Build all Docker images"
	@echo "  make logs        - Show logs from all services"
	@echo "  make clean       - Stop and remove all containers, networks, and volumes"
	@echo "  make restart     - Restart all services"
	@echo "  make db-migrate  - Run database migrations"
	@echo "  make db-shell    - Access the database shell"
	@echo ""

# Start application in production mode
up:
	docker-compose up -d

# Start application in development mode
dev:
	docker-compose -f docker-compose.dev.yml up -d

# Stop all services
down:
	docker-compose down
	docker-compose -f docker-compose.dev.yml down

# Build all images
build:
	docker-compose build

# Show logs
logs:
	docker-compose logs -f

# Clean everything
clean:
	docker-compose down -v
	docker-compose -f docker-compose.dev.yml down -v
	docker system prune -f

# Restart services
restart:
	docker-compose restart

# Run database migrations
db-migrate:
	docker-compose exec backend npx prisma migrate deploy

# Access database shell
db-shell:
	docker-compose exec db psql -U pencraft_user -d pencraft_db

# Setup environment files
setup:
	@if [ ! -f .env ]; then cp .env.example .env; echo "Created .env file"; fi
	@if [ ! -f backend/.env ]; then cp backend/.env.example backend/.env; echo "Created backend/.env file"; fi
	@if [ ! -f frontend/.env ]; then cp frontend/.env.example frontend/.env; echo "Created frontend/.env file"; fi
	@echo "Environment files are ready. Please review and update them as needed."
