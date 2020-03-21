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

      def from_token_request(request)
        email = request.params["auth"] && request.params["auth"]["email"]
        self.find_by email: email
      end
    end

    def to_jwt_token_payload
      { sub: self.id }
    end

    def to_jwt_token
      AuthJwtToken.new(payload: to_jwt_token_payload).token
    end
  end
end
