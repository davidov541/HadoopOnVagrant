# Hive Sandbox Box
This box is based on CentOS 7, and sets up an instance of Apache Hive against which basic functionality testing can be performed. This box also contains a simple Hadoop 3.2.1 installation to be used for HDFS storage and YARN runtimes. Both are run in pseudo-distributed mode on this individual server.

## Hive Distribution
This box will use the Hive distribution contained in a file called hive.tar.gz is placed in the Shared folder if that exists. This file should be a tarball of the Hive binaries to use. If this file does not exist, then Hive 3.1.2 will be downloaded and used instead.

## Usage
When the box is fully set up, it will have HDFS and YARN running in pseudo-distributed mode, but Hive will not be running by default, to allow for any additional configuration changes that are needed by the user. Once the user is ready to start Hive, then the following script should be run as root, which will start the Hive service in the background through screen.

```/vagrant_shared/runHive.sh```

After a minute or two, Hive will be up and running, and available for usage. Logs for the Hive service can be seen in /tmp/hive.
