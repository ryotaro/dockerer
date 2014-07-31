# Install epel repository.

remote_file "/tmp/epel-release-6-8.noarch.rpm" do
  source "http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
end

rpm_package "/tmp/epel-release-6-8.noarch.rpm"

# Install docker.

yum_package "docker-io"
service "docker" do
  supports :start => true, :stop => true, :restart => true, :status => true
  action [:enable, :start]
end

