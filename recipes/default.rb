#
# Cookbook Name:: omniorbpy
# Recipe:: default
#
# Copyright 2014, Yosuke Matsusaka
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

include_recipe "build-essential"
include_recipe "python"
include_recipe "omniorb"

install_path = "/usr/local/lib/python2.7/dist-packages/omniORB/CORBA.py"

remote_file "#{Chef::Config[:file_cache_path]}/omniORBpy-#{node["omniorbpy"]["version"]}.tar.bz2" do
  source "http://downloads.sourceforge.net/project/omniorb/omniORBpy/omniORBpy-#{node["omniorbpy"]["version"]}/omniORBpy-#{node["omniorbpy"]["version"]}.tar.bz2"
  not_if { ::File.exists?(install_path) }
end

bash "compile_omniorbpy" do
  cwd "#{Chef::Config['file_cache_path']}"
  code <<-EOH
      tar xvfi omniORBpy-#{node["omniorbpy"]["version"]}.tar.bz2
      cd omniORBpy-#{node["omniorbpy"]["version"]}
      ./configure
      make clean && make && make install
  EOH
  not_if { ::File.exists?(install_path) }
end
