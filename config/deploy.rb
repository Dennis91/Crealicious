require 'bundler/capistrano'


set :application, "crealicious"
set :ip_address, "149.210.131.83"

set :deploy_to, "/home/deploy/#{application}"
set :user, "deploy"
set :use_sudo, false

set :scm, :git
set :repository,  "git@github.com:Dennis91/Crealicious.git"
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :ssh_options, {:forward_agent => true }

default_run_options[:pty] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, ip_address                  # Your HTTP server, Apache/etc
role :app, ip_address                          # This may be the same as your `Web` server
role :db,  ip_address, :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
namespace :assets do
    desc "compile assets locally and upload before finalize_update"
    task :deploy do
        %x[bundle exec rake assets:clean && bundle exec rake assets:precompile]
        ENV['COMMAND'] = " mkdir '#{release_path}/public/assets'"
        invoke
        upload '/path/to/app/public/assets', "#{release_path}/public/assets", {:recursive => true}
    end
end
after "deploy:finalize_update", "assets:deploy"

