# frozen_string_literal: true

module Knock
  # Include into entity class (e.g. User) for token serialization, deserialization
  module Tokenizable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def from_jwt_token_payload(payload)
        find(payload["sub"])
      end

      def from_jwt_token(t)
        from_jwt_token_payload(AuthJwtToken.new(token: t).payload)
      end
    end

    def to_token_payload
      { sub: @object.id }
    end

    def to_token
      AuthJwtToken.new(payload: to_token_payload).token
    end
  end
end
