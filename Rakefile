#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'resque/tasks'
require 'resque_scheduler/tasks'
namespace :resque do
  task :setup do
    require 'resque'
    require 'resque_scheduler'
    require 'resque_scheduler/tasks'

    Resque.schedule = YAML.load_file('config/resque_schedule.yml')
  end
end

Associalize::Application.load_tasks