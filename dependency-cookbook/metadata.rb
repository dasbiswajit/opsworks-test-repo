name 'dependency-cookbook'
maintainer 'Biswajit Das'
maintainer_email 'biswajitbangalore@gmail.com'
license 'All rights reserved'
description 'This cookbook is to test dependency'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'
%w(redhat suse).each do |os|
  supports os
end
