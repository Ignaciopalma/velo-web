# Load DSL and set up stages
2 require 'capistrano/setup'
3
4 # Include default deployment tasks
5 require 'capistrano/deploy'
6
7 # Include tasks from other gems included in your Gemfile
8 require 'capistrano/rvm'
9 require 'capistrano/bundler'
ruby
10 require 'capistrano/rails/'
11 require 'capistrano/passenger'
12 require 'capistrano/ssh_doctor'
13
14 # Load custom tasks from `lib/capistrano/tasks` if you have any defined
15 Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }