#!/bin/bash

echo "🐳 PenCraft Docker Application Test"
echo "===================================="

echo ""
echo "Testing Backend Health..."
BACKEND_RESPONSE=$(curl -s http://localhost:8080/api/v1/user/health)
if [[ $? -eq 0 ]]; then
    echo "✅ Backend: $BACKEND_RESPONSE"
else
    echo "❌ Backend: Not responding"
fi

echo ""
echo "Testing Frontend..."
FRONTEND_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)
if [[ $FRONTEND_RESPONSE -eq 200 ]]; then
    echo "✅ Frontend: HTTP $FRONTEND_RESPONSE - OK"
else
    echo "❌ Frontend: HTTP $FRONTEND_RESPONSE - Error"
fi

echo ""
echo "Testing Database Connection..."
DB_TEST=$(docker-compose exec -T db psql -U pencraft_user -d pencraft_db -c "SELECT 1;" 2>/dev/null)
if [[ $? -eq 0 ]]; then
    echo "✅ Database: Connected successfully"
else
    echo "❌ Database: Connection failed"
fi

echo ""
echo "🎉 Application URLs:"
echo "Frontend: http://localhost:3000"
echo "Backend API: http://localhost:8080"
echo "Database: postgresql://pencraft_user:pencraft_password@localhost:5432/pencraft_db"
