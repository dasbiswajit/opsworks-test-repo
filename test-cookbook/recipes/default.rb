# Cookbook: test-cookbook
# Recipe: default

Chef::Log.level = :debug
include_recipe 'dependency-cookbook::default'
# Get the current version from metadata
Log.info("Node attributes value is : " + node.default['test-cookbook']['attribute1'])

# test file resource
file '/tmp/testfile.log' do
  content 'This is a test file'
  mode '0755'
  owner 'root'
  group 'root' 
end

#execute yum repolist

execute 'yum_repolist' do
  command 'yum repolist'
end
