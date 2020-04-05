# frozen_string_literal: true

module Knock
  module ApiGlobalToken
    private

    # NOTE: before_action :authenticate_with_global_api_token
    def authenticate_with_global_api_token
      if Knock.api_token_simple_global.blank?
        head(:unauthorized)
        return false
      end

      authenticate_or_request_with_http_token do |token, options|
        # Compare tokens in a time-constant manner, to mitigate timing attacks
        ActiveSupport::SecurityUtils.secure_compare(token, Knock.api_token_simple_global)
      end
    end
  end
end
