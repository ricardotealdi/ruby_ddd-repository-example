if defined?(Dotenv)
  env_file = File.join(
    RepositoriesExample.root, ".env.#{ENV['RUBY_ENV']}"
  )

  if File.exist?(env_file)
    Dotenv.load env_file
  else
    Dotenv.load
  end
end
