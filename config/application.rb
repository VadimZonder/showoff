require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActiveStorageWithPreviewsExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    config.secret_key_base = "f0a53a0fb24cb381a791d557413fd1fe82a384430fe150754bfcbe48ff0b60f2233c59f2626a4ea904a93a35a5dada8dfe85d2f9a52b2235feec336f63e96f8b"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
