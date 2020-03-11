# Kafka Sandbox Box
This box is based on CentOS 7, and sets up an instance of Apache Kafka against which basic functionality testing can be performed. This box uses the default Kafka 2.4.0 distribution. 

## Usage
When the box is first started, Kafka is not started in order to allow for any configuration changes that are desired before the service is started. Once these configuration changes are made, the following script should be run as the kafka user in order to start the Kafka service.

```
/home/kafka/runKafka.sh
```
