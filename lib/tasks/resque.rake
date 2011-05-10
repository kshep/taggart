require 'resque/tasks'
require 'resque_scheduler'
require 'resque_scheduler/tasks'

task "resque:scheduler" => :environment
task "resque:work" => :environment

Resque.schedule = YAML.load_file(File.join(Rails.root, 'config/resque_schedule.yml'))
#task "resque:work" => "resque:scheduler_setup"
