# Start docker service
systemctl start docker

# Build and run containers
docker-compose up -d --build

# Check service availability
until curl --fail --insecure https://localhost; do 
  sleep 1
done

curl -v -u admin:admin123 --insecure --header 'Content-Type: application/json' 'https://localhost/service/rest/v1/script' -d @nexus-repository/create-docker-proxy.json
curl -v -X POST -u admin:admin123 --insecure --header 'Content-Type: text/plain' 'https://localhost/service/rest/v1/script/CreateDockerProxy/run'
