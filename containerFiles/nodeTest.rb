require 'dcell'
require 'dcell/registries/redis_adapter'

registry = DCell::Registry::RedisAdapter.new

puts registry

DCell.start :registry => registry