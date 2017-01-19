# Cookbook: dependency-cookbook
# Recipe: default

# Get the current version from metadata
Log.info("Node attributes value is : " + node.default['dependency-cookbook']['attribute'])

include_recipe 'test-cookbook::default'
