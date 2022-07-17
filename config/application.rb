require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Colchonet
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
    I18n.available_locales = [:"pt-BR", :en]
    
    config.time_zone = "Brasilia"
    config.i18n.default_locale = :'pt-BR'
  end
end
