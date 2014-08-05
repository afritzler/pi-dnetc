#
# Cookbook Name:: pi-dnetc
# Recipe:: default
#
# Copyright 2014, Andreas Fritzler
#
# All rights reserved - Do Not Redistribute
#

# Download the dnetc client
remote_file "#{node['dnetc_cache_dir']}/#{node['dnetc_pgk']}" do
  source node["dnetc_url"]
end

# Unzip the packge

# Write the configuration file
