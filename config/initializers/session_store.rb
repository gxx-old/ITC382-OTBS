# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_OTBS_session',
  :secret      => 'eaa9472e93f0a8d3dab857730cf03e1161b668e89d233c4497cee4695803478626c25377d280b5c5d66c102e1e753ea3345b2ca3b062e699ed863a8db3302b9d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
