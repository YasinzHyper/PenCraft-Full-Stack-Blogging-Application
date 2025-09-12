# PenCraft

<img width="1226" alt="image" src="https://github.com/user-attachments/assets/f075039a-a8a2-4330-b7c8-b26d66ca2e8c">


This project aims to create a blogging platform using modern technologies for both frontend and backend. It utilizes a robust stack including React for the frontend, Cloudflare Workers for the backend, and a combination of other tools for validation, ORM, database, and authentication.

## Technologies Used

- **Frontend:**

  - React: A popular JavaScript library for building user interfaces.
  - Zod: A TypeScript-first schema declaration and validation library.
  - TypeScript: A statically typed superset of JavaScript that compiles to plain JavaScript.

  - **Styling:**
  - Tailwind CSS: A utility-first CSS framework that provides low-level utility classes to build custom designs.
  - Aceternity UI: A collection of reusable UI components built with Tailwind CSS, designed for rapid development and consistent styling.

- **Backend:**
  - Cloudflare Workers: A serverless execution environment that allows you to create lightweight, scalable backend applications.
  - Prisma: A modern database toolkit for TypeScript and Node.js that simplifies database access.
  - Postgres: A powerful, open-source relational database system.
  - JWT (JSON Web Tokens): A compact, URL-safe means of representing claims to be transferred between two parties securely.
  - Using WebCrypto for hashing passsword before storing in the database.

## Setup Instructions

### Quick Start with Docker (Recommended)

The easiest way to run PenCraft is using Docker and Docker Compose. This method requires no manual setup of databases, Node.js, or other dependencies.

#### Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed on your system
- [Docker Compose](https://docs.docker.com/compose/install/) (usually included with Docker Desktop)

#### Running the Application

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd PenCraft-Full-Stack-Blogging-Application
   ```

2. **Copy environment variables:**
   ```bash
   cp .env.example .env
   cp backend/.env.example backend/.env
   cp frontend/.env.example frontend/.env
   ```

3. **Update environment variables (optional):**
   Edit the `.env` files to customize database credentials, JWT secrets, and other configuration options.

4. **Start the application:**
   ```bash
   # For development with hot reload
   docker-compose -f docker-compose.dev.yml up -d

   # Or for production build
   docker-compose up -d
   ```

5. **Access the application:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8080
   - Database: postgresql://pencraft_user:pencraft_password@localhost:5432/pencraft_db

#### Docker Commands Reference

```bash
# Start all services in the background
docker-compose up -d

# View logs from all services
docker-compose logs -f

# Stop all services
docker-compose down

# Stop and remove all data (including database)
docker-compose down -v

# Rebuild and start services (after code changes)
docker-compose up --build -d

# Run database migrations manually (if needed)
docker-compose exec backend npx prisma migrate deploy

# Access the database directly
docker-compose exec db psql -U pencraft_user -d pencraft_db

# View running containers
docker-compose ps

# Restart a specific service
docker-compose restart backend
```

#### Development with Docker

For development with hot reload:

```bash
# Start development environment
docker-compose -f docker-compose.dev.yml up -d

# Follow logs
docker-compose -f docker-compose.dev.yml logs -f

# Stop development environment
docker-compose -f docker-compose.dev.yml down
```

#### Docker Architecture

The Docker setup includes three main services:

1. **PostgreSQL Database (`db`)**: 
   - Official PostgreSQL 15 Alpine image
   - Persistent data storage with Docker volumes
   - Health checks to ensure database readiness

2. **Backend API (`backend`)**:
   - Node.js 18 Alpine with Hono framework
   - Automatic Prisma migrations on startup
   - Environment variables for database connection and JWT secrets

3. **Frontend (`frontend`)**:
   - React with Vite build system
   - Nginx for serving static files in production
   - Reverse proxy configuration for API calls

#### Environment Variables

The application uses environment variables for configuration:

- **Database**: Connection string, user credentials
- **Backend**: JWT secret, port configuration, Cloudinary settings
- **Frontend**: Backend API URL, app configuration

Copy the example files and customize as needed:
```bash
cp .env.example .env
cp backend/.env.example backend/.env  
cp frontend/.env.example frontend/.env
```

#### Useful Docker Commands with Makefile

A Makefile is provided for easier management:

```bash
make setup       # Copy environment files
make up          # Start production environment  
make dev         # Start development environment
make logs        # View logs
make down        # Stop services
make clean       # Remove all containers and volumes
make db-migrate  # Run database migrations
make db-shell    # Access database shell
```

#### Troubleshooting Docker Setup

1. **Port conflicts:** If ports 3000, 8080, or 5432 are already in use, modify the port mappings in `docker-compose.yml`

2. **Permission issues:** On Linux/macOS, you might need to run Docker commands with `sudo`

3. **Database connection issues:** Ensure the database service is healthy before the backend starts:
   ```bash
   docker-compose logs db
   ```

4. **Build issues:** Clear Docker cache and rebuild:
   ```bash
   docker-compose down
   docker system prune -f
   docker-compose up --build
   ```

### Manual Setup (Alternative)

If you prefer to set up the application manually without Docker:

### Frontend

1. Navigate to the `frontend` directory.
2. Run `npm install` to install dependencies.
3. Run `npm run dev` to start the development server.
4. Access the development server at `http://localhost:3000`.

### Backend

1. Navigate to the `backend` directory.
2. Run `npm install` to install dependencies.
3. Set up your Postgres database and configure the connection in `prisma/schema.prisma`.
4. Run `npx prisma migrate dev` to apply migrations and generate Prisma client.
5. Run `npm run dev` to start the backend server.
6. Access the backend server at `http://localhost:8080`.

## Authentication (Cookies Approach)

For authentication, this project utilizes JSON Web Tokens (JWT) along with a cookies-based approach.

1. Upon successful login, a JWT token is generated server-side and sent to the client.
2. The JWT token is then stored in an HTTP-only cookie for enhanced security.
3. Subsequent requests from the client include this token in the cookie header.
4. The server validates the JWT token to authenticate the user for protected routes.

## Additional Functionalities

### Bookmark Functionality

Users can bookmark their favorite posts for quick access.

### Search Functionality

Users can search for posts based on keywords or tags.

### Delete Bookmark with Confirmation Model

Users can delete bookmarks with a confirmation model to prevent accidental deletion.

###

## Image Upload Feature

Working on to supports image uploads, allowing users to enhance their blog posts with images. (Will add it after I get my credit card)

## Add rich text editor

Added jodit editor .

## Images:

<img width="1710" alt="image" src="https://github.com/user-attachments/assets/f7c0adb4-6e0b-4de2-b914-34a9d3bdd47e">

<img width="1710" alt="image" src="https://github.com/user-attachments/assets/4c11eff6-fe58-4304-ab25-ec4b26883022">


## ❤️Our Valuable Contributors

[![Contributors](https://contrib.rocks/image?repo=AkshitLakhera/PenCraft-Full-Stack-Blogging-Application)](https://github.com/AkshitLakhera/PenCraft-Full-Stack-Blogging-Application/graphs/contributors)

## Contributors

- **Abhi-hertz** - [@93651229+AE-Hertz](https://github.com/93651229+AE-Hertz)
- **Akshit lakhera** - [@akshitlakhera14](https://github.com/akshitlakhera14)
- **Ananya Gupta** - [@145869907+ananyag309](https://github.com/145869907+ananyag309)
- **Aryan Ramesh Jain** - [@138214350+jainaryan04](https://github.com/138214350+jainaryan04)
- **Bhumika** - [@sharmabhmi](https://github.com/sharmabhmi)
- **Edasgh** - [@edas25564](https://github.com/edas25564)
- **MIGHTY1o1** - [@shubhagarwalcse](https://github.com/shubhagarwalcse)
- **Nikhil Saxena** - [@91839763+Cleveridiot07](https://github.com/91839763+Cleveridiot07)
- **Pavan Shanmukha Madhav Gunda** - [@pavanshanmukhmadhav](https://github.com/pavanshanmukhmadhav)
- **Rahul Kumar** - [@rahulbarnwalonlyu2](https://github.com/rahulbarnwalonlyu2)
- **Risheendra183** - [@yannamrishee](https://github.com/yannamrishee)
- **Saksham Saraf** - [@122025299+sakshamsaraf23](https://github.com/122025299+sakshamsaraf23)
- **Samyak Aditya** - [@91079592+samyak-aditya](https://github.com/91079592+samyak-aditya)
- **Shariq** - [@shariqsd2003](https://github.com/shariqsd2003)
- **Shubham Pandey** - [@69081168+heizshubham](https://github.com/69081168+heizshubham)
- **Siddhi Sahu** - [@himanisahu739](https://github.com/himanisahu739)
- **Umesh Kumar** - [@149981630+UmeshKumar0143](https://github.com/149981630+UmeshKumar0143)
- **UmeshKumar0143** - [@umeshkumar153654](https://github.com/umeshkumar153654)
- **ayushrana83** - [@168258223+ayushrana83](https://github.com/168258223+ayushrana83)
- **dependabot** - [@49699333+dependabot[bot]](https://github.com/49699333+dependabot[bot])
- **dev129** - [@76431221+dev129](https://github.com/76431221+dev129)
- **iamDyeus** - [@dyeusyt](https://github.com/dyeusyt)
- **kartikeyyy** - [@kartikeykvk369](https://github.com/kartikeykvk369)
- **khaulanauman** - [@khaulanauman](https://github.com/khaulanauman)
- **sezallagwal** - [@sezal1470](https://github.com/sezal1470)
- **smog-root** - [@machha.shashank](https://github.com/machha.shashank)
- **tarunkumar2005** - [@tarunkumar6258278](https://github.com/tarunkumar6258278)
- **tejasbenibagde** - [@124677750+tejasbenibagde](https://github.com/124677750+tejasbenibagde)
