#!/bin/bash
pushd /home/hive

su -c "screen -d -m hive --service hiveserver2 --hiveconf datanucleus.schema.autoCreateAll=true --hiveconf hive.metastore.schema.verification=false" - hive