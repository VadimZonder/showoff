require_relative 'boot'

require 'rails/all'
require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActiveStorageWithPreviewsExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.secret_key_base = "3898c78e9e745bf5225207e48f25d596064088fd0c1514c2a0a9ebc88463e1abbc69c24f5942e32e96975a5caa9b6f0fd7e29cb40c87d77e8a404051902a160d"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
