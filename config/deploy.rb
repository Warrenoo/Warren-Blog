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
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

#namespace :deploy do

  #after :finishing, 'deploy:cleanup'

  #task :upload do
    #on release_roles :app do |host|
      #upload! 'config/publisher.yml.example', "#{fetch(:deploy_to)}/shared/config/publisher.yml"
    #end
  #end

  
  
  ## 重启服务
  #task :start do
    #on roles(fetch(:unicorn_roles)) do
      #within current_path do
        #execute "cd #{current_path} && bundle exec bluepill --no-privileged start unicorn RAILS_ENV=#{fetch(:rails_env)}"
      #end
    #end
  #end

  #task :stop do
    #on roles(fetch(:unicorn_roles)) do
      #within current_path do
        #execute "cd #{current_path} && bundle exec bluepill --no-privileged stop unicorn RAILS_ENV=#{fetch(:rails_env)}"
      #end
    #end
  #end
  #task :restart do
    #on roles(fetch(:unicorn_roles)) do
      #if fetch(:rails_env) == 'production'
        #execute "cd #{current_path} && bundle exec bluepill --no-privileged restart unicorn RAILS_ENV=#{fetch(:rails_env)}"
      #else
        #invoke 'unicorn:restart'
      #end
    #end
  #end
  
  #task :restart_unicorn do
    #on roles(fetch(:unicorn_roles)) do
      #if fetch(:rails_env) == 'production'
        #execute "cd #{current_path} && bundle exec bluepill --no-privileged restart unicorn RAILS_ENV=#{fetch(:rails_env)}"
      #else
        #invoke 'unicorn:restart'
      #end
    #end
  #end

  #task :stop_unicorn do
    #on roles(fetch(:unicorn_roles)) do
      #if fetch(:rails_env) == 'production'
        #execute "cd #{current_path} && bundle exec bluepill --no-privileged restart unicorn RAILS_ENV=#{fetch(:rails_env)}"
      #else
        #invoke 'unicorn:stop'
      #end
    #end
  #end

#end
