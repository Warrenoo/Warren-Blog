require 'capistrano/scm'
require 'capistrano/console'

lock '3.4.0'

set :application, 'warrenoo_blog'
set :deploy_user, 'root'

set :scm, :git
set :repo_url, 'https://github.com/Warrenoo/Warren-Blog.git'

set :deploy_to, "/project/warren_blog"

set :deploy_via, :remote_cache

set :linked_files, %w{config/database.yml config/secrets.yml config/newrelic.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/images}

set :keep_releases, 5

namespace :deploy do

  after :finishing, 'deploy:cleanup'

  # 重启服务
  task :restart do
    on roles(fetch(:web)) do
      execute "cd #{current_path} && bundle exec thin restart -C /etc/thin/Warren_19001.yml"
    end
  end

end

after 'deploy:publishing', 'deploy:restart'
