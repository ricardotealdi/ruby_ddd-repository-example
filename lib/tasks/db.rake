namespace :db do
  desc 'Database configurations'
  task config: :environment do
    MIGRATIONS_DIR = File.join(
      RepositoriesExample.root, 'db', 'migrate'
    )
  end

  desc 'Runs the database migrations'
  task migrate: :'db:config' do

    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate(
      MIGRATIONS_DIR,
      ENV['VERSION'] ? ENV['VERSION'].to_i : nil
    )
  end

  desc 'Runs a database rollback'
  task rollback: :'db:config' do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback MIGRATIONS_DIR, step
  end
end
