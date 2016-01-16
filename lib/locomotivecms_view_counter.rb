require 'locomotive/steam'

require_relative 'locomotive/view_counter'

Locomotive::Steam.configure_extension do |config|
  config.middleware.insert_after Locomotive::Steam::Middlewares::TemplatizedPage, Locomotive::ViewCounter::Middleware
end
