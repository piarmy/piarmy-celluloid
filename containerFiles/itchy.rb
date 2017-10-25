$stdout.sync = true

require 'bundler/setup'
require 'dcell'
require 'dcell/registries/redis_adapter'
require 'awesome_print'

ipaddress=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

registry = DCell::Registry::RedisAdapter.new :server => "#{ipaddress}"

DCell.start :id => "itchy", :addr => "tcp://#{ipaddress}:9500", :registry => registry

ap DCell.me

ap DCell::Node.methods - Kernel.methods

ap DCell::Node.to_a

class Itchy
  include Celluloid

  def initialize
    hostname=`hostname`
    puts "Host: #{hostname}"
    puts "Ready for mayhem!"
    @n = 0
  end

  def fight
    ap DCell::Node.to_a

    @n = (@n % 6) + 1
    if @n <= 3
      puts "Bite!"
    else
      puts "Fight!"
    end
  end
end

Itchy.supervise_as :itchy
sleep