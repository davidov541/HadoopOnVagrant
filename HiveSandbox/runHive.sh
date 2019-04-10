#!/bin/bash
HIVE_HOME=/grid/hive
HADOOP_HOME=/grid/hadoop-3.1.1
PATH=$PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin
JAVA_HOME=/usr

pushd /home/hive

hive --service hiveserver2 --hiveconf datanucleus.schema.autoCreateAll=true --hiveconf hive.metastore.schema.verification=false