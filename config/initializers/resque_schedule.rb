require 'resque_scheduler'
require 'resque/scheduler'

Resque.redis = 'localhost:6379'
Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
Resque.schedule = YAML.load_file('config/resque_schedule.yml')