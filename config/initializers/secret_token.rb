# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#VeterinaryApp::Application.config.secret_key_base = '754e3c3c7214d260e10708ac8e690886280d5ceae91d3e585d25e55d8b711cfc98587dc516af2875b26f7619cb226516909175d0e43b35ecdad85cebe883dc51'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

VeterinaryApp::Application.config.secret_key_base = secure_token