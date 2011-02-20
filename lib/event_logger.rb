%w{ models }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

module EventLogger
  def self.current_request
    event_logger_store[:current_request]
  end
  
  def self.current_request=(value)
    event_logger_store[:current_request] = value
  end
  
  private
  
  # who knows about threads? why is this done this way?
  def self.event_logger_store
    Thread.current[:event_logger] ||= {}
  end
end

require 'app/models/event_log'
require 'event_logger/current_request'