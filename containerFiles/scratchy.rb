require 'dcell'
require 'awesome_print'

ipaddress=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

DCell.start :id => "scratchy", :addr => "tcp://#{ipaddress}:9501"
itchy_node = DCell::Node["itchy"]

puts "Fighting itchy! (check itchy's output)"

6.times do
  itchy_node[:itchy].fight
  ap DCell::Node.all
  sleep 1
end