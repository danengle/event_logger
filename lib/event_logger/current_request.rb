module EventLogger
  module CurrentRequest
    
    def self.included(base)
      base.before_filter :collect_request_data
    end
    
    protected
    
    def whodunnit
      current_user rescue nil
    end
    
    private
    
    def collect_request_data
      ::EventLogger.current_request = {
        :whodunnit => whodunnit,
        :controller_name => controller_name,
        :action_name => action_name
      }
    end
  end
end
ActionController::Base.send :include, ::EventLogger::CurrentRequest

Kernel.module_eval do
  def current_request
    ::EventLogger.current_request
  end
end