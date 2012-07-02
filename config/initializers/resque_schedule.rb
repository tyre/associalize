require 'resque_scheduler'
require 'resque/scheduler'

if Rails.env.production?
  Resque.redis = ENV['REDISTOGO_URL']
else
  Resque.redis = 'localhost:6379'
end

Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
Resque.schedule = YAML.load_file('config/resque_schedule.yml')