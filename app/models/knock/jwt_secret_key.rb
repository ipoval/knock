# frozen_string_literal: true

module Knock
  module JwtSecretKey
    private

    def jwt_secret_key
      Knock.token_secret_signature_key.call
    end
    module_function :jwt_secret_key
  end
end
