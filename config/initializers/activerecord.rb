if ENV['DATABASE_VERBOSE']
  ActiveRecord::Base.logger = RepositoriesExample.logger
end

ActiveRecord::Base.establish_connection ENV.fetch('DATABASE_URL')
