# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Vigitox_session',
  :secret      => '0f447b932d91f1cb4107e280f052a7acd31e7153104d571ec50fdb6a08c379dcc773b6c4afda1a8227bf4a673a93bcd96f42402a0d71011c6ccc1850fb6a972e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
