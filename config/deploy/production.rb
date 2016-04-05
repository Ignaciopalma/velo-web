set :stage, :production
set :rails_env, :production

server '52.38.131.93', user: 'ubuntu', roles: %w{web app db}, primary: true