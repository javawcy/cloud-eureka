version=$1

echo "====eureka server====="

mvn clean install -Dmaven.test.skip=true

docker build -f docker/Dockerfile -t 192.168.10.124:8889/public/eureka:"${version}" .
docker push 192.168.10.124:8889/public/eureka:"${version}"
docker rmi 192.168.10.124:8889/public/eureka:"${version}"

#docker run -d -p 9991:8080 --name eureka1 --hostname eureka1 --network cloud-demo 192.168.10.124:8889/public/eureka:latest
#docker run -d -p 9992:8080 --name eureka2 --hostname eureka2 --network cloud-demo 192.168.10.124:8889/public/eureka:latest
#docker run -d -p 9993:8080 --name eureka3 --hostname eureka3 --network cloud-demo 192.168.10.124:8889/public/eureka:latest