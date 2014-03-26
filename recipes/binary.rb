#
# Cookbook Name:: kafka
# Recipe:: binary
#

node.default[:kafka][:scala_version] ||= '2.8.0'
node.default[:kafka][:checksum]      ||= '6323538013535d3fe8c079dec0a428a93c8a3e8a667482d0b6daca69d3a00700'
node.default[:kafka][:md5_checksum]  ||= '3724dc1f4eb69723bf716ad3f0c8fa49'

kafka_tar_gz      = %(#{kafka_base}.tgz)
local_file_path   = ::File.join(Chef::Config[:file_cache_path], kafka_tar_gz)
kafka_target_path = ::File.join(node[:kafka][:build_dir], kafka_base)

kafka_download local_file_path do
  source       kafka_download_uri(kafka_tar_gz)
  checksum     node[:kafka][:checksum]
  md5_checksum node[:kafka][:md5_checksum]
  not_if { kafka_installed? }
end

execute 'extract-kafka' do
  user     node[:kafka][:user]
  group    node[:kafka][:group]
  cwd      node[:kafka][:build_dir]
  command  %(tar zxf #{local_file_path})
  not_if { kafka_installed? }
end

kafka_install node[:kafka][:install_dir] do
  from kafka_target_path
  not_if { kafka_installed? }
end
