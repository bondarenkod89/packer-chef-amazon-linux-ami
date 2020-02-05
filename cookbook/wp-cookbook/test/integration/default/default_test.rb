# InSpec test for recipe wp-cookbook::apache

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('httpd') do
  it { should be_installed }
end

describe package('mariadb') do
  it { should be_installed }
end

describe package('mariadb-server') do
  it { should be_installed }
end