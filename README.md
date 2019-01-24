This project is forked from [big-data-europe/docker-hadoop](https://github.com/big-data-europe/docker-hadoop) for my customizatin needs.
This project is forked from [sangwonl/docker-hadoop-cluster](https://github.com/sangwonl/docker-hadoop-cluster) for my customizatin needs.

# Hadoop Docker

## Supported Hadoop Versions
* Hadoop 2.7.1 with OpenJDK 8 on Ubuntu 16.04

You can also compile the specific hadoop with [hadoop-compiler](https://github.com/sangwonl/docker-hadoop-compiler)

## Description

To deploy an example HDFS cluster, run:
```
  make build-base
  docker network create -d bridge hadoop
  docker-compose -f docker-compose-local.yml up
```
```
# YARN test : https://blog.acronym.co.kr/370
$ docker exec -it namenode /bin/bash
> hdfs dfs -ls /
> hdfs dfs -mkdir /test1
> hdfs dfs -put ./entrypoint.sh /test1
```
The configuration parameters can be specified in the hadoop.env file or as environmental variables for specific services (e.g. namenode, datanode etc.):
```
  CORE_CONF_fs_defaultFS=hdfs://namenode:8020
```

CORE_CONF corresponds to core-site.xml. fs_defaultFS=hdfs://namenode:8020 will be transformed into:
```
  <property><name>fs.defaultFS</name><value>hdfs://namenode:8020</value></property>
```
To define dash inside a configuration parameter, use double underscore, such as YARN_CONF_yarn_log___aggregation___enable=true (yarn-site.xml):
```
  <property><name>yarn.log-aggregation-enable</name><value>true</value></property>
```

The available configurations are:
* /etc/hadoop/core-site.xml CORE_CONF
* /etc/hadoop/hdfs-site.xml HDFS_CONF
* /etc/hadoop/yarn-site.xml YARN_CONF
* /etc/hadoop/httpfs-site.xml HTTPFS_CONF
* /etc/hadoop/kms-site.xml KMS_CONF

If you need to extend some other configuration file, refer to base/entrypoint.sh bash script.

After starting the example Hadoop cluster, you should be able to access interfaces of all the components (substitute domain names by IP addresses from ```network inspect hadoop``` command):
* Namenode: http://namenode:50070/dfshealth.html#tab-overview
* History server: http://historyserver:8188/applicationhistory
* Datanode: http://datanode:50075/
* Nodemanager: http://nodemanager:8042/node
* Resource manager: http://resourcemanager:8088/
