require "./traphandle/*"
require "redis"

raise("Plese give arguments: test(0=false,1=true), redis_host, redis_port, redis_list, redis_password") if ARGV.size != 5
test = ARGV[0].to_i
raise("'test' argument must either be 0 (false) or 1 (true)") unless (test == 1 || test == 0)
redis_h = ARGV[1]
redis_p = ARGV[2].to_i
redis_l = ARGV[3]
redis_pw = ARGV[4]
puts("#{redis_h}:#{redis_p}, list: #{redis_l}, pw: #{redis_pw}") if test == 1

source_hostname = STDIN.read_line
connection_info = STDIN.read_line

oids = Array(String).new
STDIN.each_line do |line|
  oids << line
end
raise("illegal trap") if oids.size < 1
time = Time.utc_now.to_s("%Y-%m-%dT%H:%M:%S.%6NZ")
data = oids.join("\n")
trap = "#{time}\n#{source_hostname}\n#{connection_info}\n#{data}\n"

puts trap if test == 1
if test == 0
  redis = Redis.new(host: redis_h, port: redis_p, password: redis_pw)
  redis.rpush(redis_l, trap)
  redis.close
end
