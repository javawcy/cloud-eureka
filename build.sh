echo "====eureka server====="

mvn clean install -Dmaven.test.skip=true

#read -r -p "chose server [1/2/3]: " server

docker build -f docker/Dockerfile -t eureka:latest .
docker rm -f $(docker ps | grep 'eureka*' | awk '{print$1}')

#port=8080
#case $server in
#  1) port=9991
#  ;;
#  2) port=9992
#  ;;
#  3) port=9993
#esac

docker run -d -p 9991:8080 --name eureka1 --hostname eureka1 --network cloud-demo eureka:latest
docker run -d -p 9992:8080 --name eureka2 --hostname eureka2 --network cloud-demo eureka:latest
docker run -d -p 9993:8080 --name eureka3 --hostname eureka3 --network cloud-demo eureka:latest