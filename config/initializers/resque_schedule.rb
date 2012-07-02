require 'resque_scheduler'
require 'resque/scheduler'

if Rails.env.production?
  uri = URI.parse(ENV['REDISTOGO_URL'])
  Resque.redis = ENV['REDISTOGO_URL']
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  Resque.redis = 'localhost:6379'
  $redis = Redis.new
end

Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
Resque.schedule = YAML.load_file('config/resque_schedule.yml')