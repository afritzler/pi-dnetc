#
# Cookbook Name:: pi-dnetc
# Recipe:: default
#
# Copyright 2014, Andreas Fritzler
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Download the dnetc client
remote_file "#{node['dnetc_cache_dir']}/#{node['dnetc_pgk']}" do
  source node["dnetc_url"]
end

# Unzip the packge
bash "untar the downloaded packege" do
  user "root"
  group "staff"
  cwd node['dnetc_install_dir']
  code <<-EOH
  tar -zxf #{node['dnetc_cache_dir']}/#{node['dnetc_pgk']}
  EOH
end

# Link executable to bin folder
if !File.exist?(node['dnetc_symlink'])
  bash "create symlink in bin folder" do
    user "root"
    group "staff"
    cwd node['dnetc_install_dir']
    code <<-EOH
    ln -s #{node['dnetc_install_dir']}/#{node['dnetc_arch']}/dnetc #{node['dnetc_symlink']}
    EOH
  end
end

# Clean up
bash "clean up downloaded files" do
  user "root"
  cwd node['dnetc_install_dir']
  code <<-EOH
  rm #{node['dnetc_cache_dir']}/#{node['dnetc_pgk']}
  EOH
end
