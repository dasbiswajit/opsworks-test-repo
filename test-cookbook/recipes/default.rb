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

ruby_block "check" do
    block do
        #tricky way to load this Chef::Mixin::ShellOut utilities
        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
        repo_list_command = 'yum repolist'
        yum_security_check_command = 'yum --security check-update'
        command_out = shell_out(repo_list_command)
       Log.info('Repolist: ' + command_out.stdout)
       security_check_command_output = shell_out(yum_security_check_command)
       Log.info('security_check_output: ' + security_check_command_output.stdout.to_s)
    end
    action :create
end
