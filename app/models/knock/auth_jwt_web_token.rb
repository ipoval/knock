# frozen_string_literal: true

require "jwt"

module Knock
  class AuthJwtWebToken
    include Knock::JwtSecretKey

    # Knock::AuthJwtWebToken.encode({ sub: 1 })
    def self.encode(payload)
      JWT.encode payload, Knock::JwtSecretKey.jwt_secret_key
    end

    def self.decode(jwt_token)
      JWT.decode jwt_token, Knock::JwtSecretKey.jwt_secret_key
    end
  end
end
