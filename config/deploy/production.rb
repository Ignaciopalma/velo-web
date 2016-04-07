set :stage, :production
set :rails_env, :production

server '52.38.3.201', user: 'ubuntu', roles: %w{web app db}, primary: true