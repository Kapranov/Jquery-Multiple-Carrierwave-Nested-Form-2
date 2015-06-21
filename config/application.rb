require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module JqueryMultipleCarrierwaveNestedForm
  class Application < Rails::Application
    config.active_record.timestamped_migrations = false
    config.active_record.raise_in_transactional_callbacks = true
  end
end
