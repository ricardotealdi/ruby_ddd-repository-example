require 'logger'
require 'ostruct'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

module RepositoriesExample
  module_function

  def root
    @root ||= ::File.expand_path('../..', __FILE__)
  end

  def initialize!
    load_path 'config/initializers'
    load_path 'app'
    execute_after_initialize_blocks
  end

  def after_initialize(&block)
    @after_initialize_blocks ||= []
    @after_initialize_blocks << block
  end

  def load_tasks
    load_path 'lib/tasks', extension: 'rake', type: :load
  end

  def config
    @config ||= OpenStruct.new
  end

  def logger
    config.logger ||= Logger.new(STDOUT)
  end

  def logger=(logger)
    config.logger = logger
  end

  def execute_after_initialize_blocks
    return if @after_initialize_blocks.nil?
    @after_initialize_blocks.each(&:call)
    @after_initialize_blocks.clear
  end

  def load_path(path, extension: 'rb', type: :require)
    full_path = ::File.join(root, path, '**', "*.#{extension}")
    files = ::Dir[full_path].sort
    files.each do |file|
      if type == :require
        require(file)
      else
        load(file)
      end
    end
  end
end
