# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'hedera'
set :repo_url, 'git@github.com:acandael/hedera-rails.git'
set :deploy_to, '/opt/www/hedera'
set :user, 'deploy'
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  %w[start stop restart].each do |command|
    desc 'Manage Unicorn'
    task command do
      on roles(:app), in: :sequence, wait: 1 do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end      
    end
  end

  after :publishing, :restart

end
