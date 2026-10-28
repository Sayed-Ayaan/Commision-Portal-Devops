# Insurance Agent Commission Portal 
http://localhost:8085/commission-portal/

java -jar "C:\Program Files\Jenkins\jenkins.war"

mvn clean package -DskipTests
docker build -t commission-portal:v1.0.0 .
docker run -d -p 8085:8080 --name commission-container commission-portal:v1.0.0