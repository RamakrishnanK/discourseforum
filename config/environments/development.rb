Discourse::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Don't Digest assets, makes debugging uglier
  config.assets.digest = false
  config.serve_static_assets = true

  config.assets.debug = true

  config.watchable_dirs['lib'] = [:rb]

  config.sass.debug_info = false
  config.handlebars.precompile = false

  # we recommend you use mailcatcher https://github.com/sj26/mailcatcher
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = { address: "localhost:3000", port: 587 }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
   config.action_mailer.smtp_settings = {
     :address              => "smtp.gmail.com",
     :port                 => 587,
    :domain               => 'localhost:3000',
    :user_name            => 'beaconlms@gmail.com',
     :password             => 'beaconlms123$',
     :authentication       => 'plain',
    :enable_starttls_auto => true  }


  BetterErrors::Middleware.allow_ip! ENV['TRUSTED_IP'] if ENV['TRUSTED_IP']

  config.enable_mini_profiler = true

  require 'middleware/turbo_dev'
  config.middleware.insert 0, Middleware::TurboDev
end

