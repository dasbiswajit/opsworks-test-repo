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

ruby_block "check" do
    block do
        #tricky way to load this Chef::Mixin::ShellOut utilities
        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)      
        command = 'yum repolist'
        command_out = shell_out(command)
       Log.info('output: ' + command_out.stdout)
    end
    action :create
end

