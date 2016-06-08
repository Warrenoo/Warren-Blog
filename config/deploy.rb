require 'capistrano/scm'
require 'capistrano/console'

SHARE_FILES = %w{config/database.yml config/secrets.yml config/newrelic.yml puma.rb}

lock '3.4.0'

set :application, 'warrenoo_blog'
set :deploy_user, 'work'

set :scm, :git
set :repo_url, 'https://github.com/Warrenoo/Warren-Blog.git'

set :deploy_to, "/workspace/warren_blog"

set :deploy_via, :remote_cache

set :linked_files, SHARE_FILES
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/images}

set :puma_conf, "#{shared_path}/puma.rb"

set :keep_releases, 5

set :rbenv_ruby, '2.3.0'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

namespace :deploy do

  task :upload do
    on release_roles :app do |host|
      SHARE_FILES.each do |f|
        upload! f, "#{fetch(:deploy_to)}/shared/#{f}"
      end
    end
  end

  after :finishing, 'deploy:cleanup'

end

after 'deploy:publishing', 'puma:restart'
