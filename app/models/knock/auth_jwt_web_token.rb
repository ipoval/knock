# frozen_string_literal: true

require "jwt"

module Knock
  class AuthJwtWebToken
    include Knock::JwtSecretKey

    EXPIRATION = 60.minutes

    attr_accessor :decoded

    # Knock::AuthJwtWebToken.encode({ sub: 1 })
    def encode(payload)
      p = get_payload_with_expiration(payload)
      JWT.encode p, jwt_secret_key
    end

    def decode(jwt_token)
      self.decoded = JWT.decode(jwt_token, jwt_secret_key)
      self
    end

    def payload
      self.decoded&.first
    end

    def headers
      self.decoded&.last
    end

    def get_payload_with_expiration(payload)
      payload.merge(exp: EXPIRATION.from_now.to_i)
    end
  end
end
