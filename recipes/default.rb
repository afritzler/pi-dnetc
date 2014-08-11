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

# Create install directory
directory node['dnetc_install_dir'] do
  owner "root"
  group "root"
  mode 00644
  action :create
end

# Unzip the packge
bash "untar the downloaded packege" do
  user "root"
  cwd node['dnetc_install_dir']
  code <<-EOH
  tar -zxf #{node['dnetc_cache_dir']}/#{node['dnetc_pgk']}
  EOH
end

# Link executable to bin folder
bash "create symlink in bin folder" do
  user "root"
  cwd node['dnetc_install_dir']
  code <<-EOH
  ln -s #{node['dnetc_install_dir']}/dnetc /usr/local/bin/dnetc
  EOH
end

# Clean up
bash "clean up downloaded files" do
  user "root"
  cwd node['dnetc_install_dir']
  code <<-EOH
  rm #{node['dnetc_cache_dir']}/#{node['dnetc_pgk']}
  EOH
end
