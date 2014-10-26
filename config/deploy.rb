lock "3.2.1"

set :rbenv_type, :system
set :rbenv_ruby, "2.1.3"
set :application, "themakingcollective.com"
set :repo_url, "git@github.com:tuzz/themakingcollective.com"
set :default_stage, "production"
set :linked_files, %w{config/secrets.yml}

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  task :bundle do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :bundle, "--without development test"
      end
    end
  end

  before "deploy:compile_assets", "bundle"
  after "publishing", "restart"
end


