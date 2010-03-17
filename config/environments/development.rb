# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = true

# Memcached also in dev-mode to see real results and to get expirity times working
config.cache_store = :mem_cache_store


LOG_TO_RESSI = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# Tell workling plugin that it should use starling gem for creating workers 
config.after_initialize do
  Workling::Remote.dispatcher = Workling::Remote::Runners::StarlingRunner.new
end

# Enable sending mail from localhost
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.hut.fi', #if needed change to own smtp server
  :port => 25,
  :domain => 'cos.alpha.sizl.org'
}