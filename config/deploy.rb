require 'capistrano/scm'
require 'capistrano/console'

lock '3.4.0'

set :application, 'warrenoo_blog'
set :deploy_user, 'work'

set :scm, :git
set :repo_url, 'https://github.com/Warrenoo/Warren-Blog.git'

set :deploy_to, "/project/warren_blog"

set :deploy_via, :remote_cache

set :linked_files, %w{config/database.yml config/secrets.yml config/newrelic.yml puma.rb}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/images}

set :puma_conf, "#{shared_path}/puma.rb"

set :keep_releases, 5

namespace :deploy do

  after :finishing, 'deploy:cleanup'

end

after 'deploy:publishing', 'puma:restart'
