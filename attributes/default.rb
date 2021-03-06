#
# Cookbook Name:: kafka
# Attributes:: default
#

#
# Version of Kafka to install.
default.kafka.version = '0.8.1.1'

#
# Base URL for Kafka releases. The recipes will a download URL using the
# `base_url`, `version` and `scala_version` attributes.
default.kafka.base_url = 'https://archive.apache.org/dist/kafka'

#
# SHA-256 checksum of the archive to download, used by Chef's `remote_file`
# resource.
default.kafka.checksum = 'cb141c1d50b1bd0d741d68e5e21c090341d961cd801e11e42fb693fa53e9aaed'

#
# MD5 checksum of the archive to download, which will be used to validate that
# the "correct" archive has been downloaded.
default.kafka.md5_checksum = '7541ed160f1b3aa1a5334d4e782ba4d3'

#
# Scala version of Kafka.
default.kafka.scala_version = '2.9.2'

#
# Directory where to install Kafka.
default.kafka.install_dir = '/opt/kafka'

#
# Directory where the downloaded archive will be extracted to, and possibly
# compiled in.
default.kafka.build_dir = ::File.join(Chef::Config[:file_cache_path], 'kafka-build')

#
# Directory where to store logs from Kafka.
default.kafka.log_dir = '/var/log/kafka'

#
# JMX port for Kafka.
default.kafka.jmx_port = 9999

#
# User for directories, configuration files and running Kafka.
default.kafka.user = 'kafka'

#
# Group for directories, configuration files and running Kafka.
default.kafka.group = 'kafka'

#
# JVM heap options for Kafka.
default.kafka.heap_opts = '-Xmx1G -Xms1G'

#
# Generic JVM options for Kafka.
default.kafka.generic_opts = nil

#
# JVM Performance options for Kafka.
default.kafka.jvm_performance_opts = '-server -XX:+UseCompressedOops -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+CMSScavengeBeforeRemark -XX:+DisableExplicitGC -Djava.awt.headless=true'

#
# The type of "init" system to install scripts for. Valid values are currently
# :sysv, :systemd and :upstart.
default.kafka.init_style = :sysv

#
# The ulimit file limit
default.kafka.ulimit_file = nil

#
# Automatically start kafka service.
default.kafka.automatic_start = false

#
# Automatically restart kafka on configuration change.
# This also implies `automatic_start` even if it's set to `false`.
# The reason for this is that I can see the need for automatically starting
# Kafka if it's not running, but not necessarily restart on configuration
# changes.
default.kafka.automatic_restart = false

#
# Attribute to set the recipe to used to coordinate Kafka service start
# if nothing is set the default recipe "coordiante" will be used
# Refer to issue #58 for details
#
default.kafka.start_coordination.recipe = 'kafka::_coordinate'

#
# `broker` namespace for configuration of a broker.
# Initially set it to an empty Hash to avoid having `fetch(:broker, {})`
# statements in helper methods and the alike.
default.kafka.broker = {}
