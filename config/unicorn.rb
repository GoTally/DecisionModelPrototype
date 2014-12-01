# config/unicorn.rb

worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)

# kill long running requests. Default: 15 seconds
# Heroku's default is 30 seconds.
timeout Integer(ENV['WEB_TIMEOUT'] || 15)
preload_app true

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end