# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do

  # Tell action_mailer what host to use for generated urls in emails
  config.action_mailer.default_url_options = {
    host: ENV['HOST'] ? ENV['HOST'] : 'localhost',
    port: ENV['PORT'] ? ENV['PORT'] : 3000
  }

end
