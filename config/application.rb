require_relative 'boot'

require 'rails/all'
require 'csv'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActiveStorageWithPreviewsExample
  class Application < Rails::Application
    

    
    config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://api-to-labels-base-vadimmalakhovski.c9users.io'
    resource(
      '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
      ) 
  end
end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.secret_key_base = "eb22e51051702de357687ba076442a7f87fa5ac0361a5380c290ae9744327cf0c4e2579a5f7c6ef2003b5710da1ac948d239eb64022d54f8c8d417f026c671ee"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
