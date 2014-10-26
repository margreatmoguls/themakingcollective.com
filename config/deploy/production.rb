role :app, %w{chris@themakingcollective.com}
role :web, %w{chris@themakingcollective.com}
role :db,  %w{chris@themakingcollective.com}

server 'themakingcollective.com', user: 'chris', roles: %w{web app}
