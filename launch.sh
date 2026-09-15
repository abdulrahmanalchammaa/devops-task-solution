if [[ ! -f "docker-compose.yml" ]]; then
    echo "Error: docker-compose.yml file not found!"
    exit 1
fi

docker-compose up --build -d

if docker ps -a --filter "status=running" --format '{{.Names}}' | grep -q "container1" && docker ps -a --filter "status=running" --format '{{.Names}}' | grep -q "container2"; then
    echo "Containers are running successfully!"
else
    echo "Error: Failed to start containers."
fi
