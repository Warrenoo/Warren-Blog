tag 'Web'

APP_ROOT = ENV['RACK_ROOT'] || ENV['PWD']
threads_count = ENV['THREADS'] || 8
workers_count = ENV['WORKERS'] || 1

directory APP_ROOT
pidfile "#{APP_ROOT}/tmp/pids/puma.pid"
state_path "#{APP_ROOT}/tmp/pids/puma.state"

bind 'tcp://0.0.0.0:3000'
bind "unix://#{APP_ROOT}/tmp/sockets/puma.sock"
stdout_redirect 'log/puma.log', 'log/puma_error.log', true

worker_timeout 30

daemonize true
threads threads_count, threads_count
workers workers_count

prune_bundler

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
