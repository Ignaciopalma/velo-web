# config valid only for current version of Capistrano
2 lock '3.4.0'
3
4 set :rvm_type, :user
5 set :rvm_ruby_version, '2.2.2'
6
7 set :application, 'velo-web'
8 set :deploy_to, "/home/ubuntu/#{fetch(:application)}"
9 set :scm, :git
ruby
10 set :repo_url, 'git@github.com:Ignaciopalma/velo-web.git'
11 set :branch, 'master'
12
13 set :linked_files, %w{config/database.yml config/secrets.yml .env}
14 set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle p
15 ublic/system public/uploads}
16
17 set :keep_releases, 4
