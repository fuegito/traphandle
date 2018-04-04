require "./traphandle/*"
require "redis"

# raise("Please give arguments: test(0=false,1=true), redis_host, redis_port, redis_list, redis_password") if ARGV.size != 5
if ARGV.size != 5
  STDERR.puts("Please give arguments: test(0=false,1=true), redis_host, redis_port, redis_list, redis_password")
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

oids = Array(String).new
source_hostname = STDIN.read_line
connection_info = STDIN.read_line

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

puts(trap) if test == 1
if test == 0
<<<<<<< HEAD
  begin
    Redis.open(host: redis_h, port: redis_p, password: redis_pw) do |redis|
      redis.rpush(redis_l, trap)
    end
  rescue
    STDERR.puts("connection to redis server #{redis_h}:#{redis_p} failed!")
    exit(3)
=======
  Redis.open(host: redis_h, port: redis_p, password: redis_pw) do |redis|
    redis.rpush(redis_l, trap)
>>>>>>> f9ea5046b95c1ac3b00a7e172a8048253c3fd2c5
  end
end
exit(0)
