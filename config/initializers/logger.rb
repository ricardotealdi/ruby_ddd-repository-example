if ENV['LOG_LEVEL']
  log_level = ENV['LOG_LEVEL'].to_i
else
  log_level = Logger::INFO
end

RepositoriesExample.logger.level = log_level
