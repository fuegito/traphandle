require "./traphandle/*"
require "redis"

# raise("Plese give arguments: test(0=false,1=true), redis_host, redis_port, redis_list, redis_password") if ARGV.size != 5
if ARGV.size != 5
  STDERR.puts("Plese give arguments: test(0=false,1=true), redis_host, redis_port, redis_list, redis_password")
  exit(1)
end

test = ARGV[0].to_i
# raise("'test' argument must be either 0 (false) or 1 (true)") unless (test == 1 || test == 0)
unless (test == 1 || test == 0)
  STDERR.puts("'test' argument must be either 0 (false) or 1 (true)")
  exit(1)
end

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
# raise("illegal trap") if oids.size < 1
if oids.size < 1
  STDERR.puts("illegal trap")
  exit(2)
end
time = Time.utc_now.to_s("%Y-%m-%dT%H:%M:%S.%6NZ")
trap = "#{time}\n#{source_hostname}\n#{connection_info}\n" + oids.join("\n")

puts trap if test == 1
if test == 0
  redis = Redis.new(host: redis_h, port: redis_p, password: redis_pw)
  redis.rpush(redis_l, trap)
  redis.close
end
exit(0)
