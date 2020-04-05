# frozen_string_literal: true

require "knock/engine"

module Knock
  # How long before a token is expired. If nil is provided, token lasts forever
  mattr_accessor :token_lifetime, default: 1.day

  # Configure the audience claim to identify the recipients that the token
  # is intended for.
  mattr_accessor :token_audience, default: nil

  # Configure the algorithm used to encode the token
  mattr_accessor :token_signature_algorithm, default: "HS256"

  # Configure the key used to sign tokens.
  mattr_accessor :token_secret_signature_key
  self.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base }

  # Configure the public key used to decode tokens, when required.
  mattr_accessor :token_public_key, default: nil

  # Configure the exception to be used when user cannot be found.
  mattr_accessor :not_found_exception_class_name, default: "ActiveRecord::RecordNotFound"

  # Configure global API simple token authentication
  mattr_accessor :api_token_simple_global, default: nil

  def not_found_exception_class
    not_found_exception_class_name.to_s.constantize
  end
  module_function :not_found_exception_class

  # Default way to setup Knock. Run `rails generate knock:install` to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
