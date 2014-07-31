# Install basic packages.
%w(tar unzip git).each do |pkg|
  package pkg
end

# Install docker.
group "docker" do
  members ["vagrant"]
end

# Change group for gem dir.
bash "gems dir attributes change" do
  user "root"
  code <<-EOC
  chgrp -R docker /opt/chef/embedded/lib/ruby/gems
  chmod -R 775 /opt/chef/embedded/lib/ruby/gems
  EOC
end

if node["platform"] == "centos" then
  include_recipe "bootstrap::centos_docker"
else
  log "Sorry, we don't support non-CentOS-based box yet."
end

# Install required gems.
%w(serverspec test-kitchen kitchen-docker kitchen-vagrant knife-solo).each do |pkg|
  gem_package pkg do
    gem_binary '/opt/chef/embedded/bin/gem'
  end
end

# Append basic .bashrc.
template "/home/vagrant/.bashrc"
