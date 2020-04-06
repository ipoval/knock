# frozen_string_literal: true

require_dependency "knock/auth_jwt_tokens_controller"

module Knock
  class UserJwtTokensController < AuthJwtTokensController
    def create_jwt_web_token
      tenant = User.find_by(email: auth_params[:email])
      if tenant.try(:authenticate, auth_params[:password])
        render json: { jwt_token: Knock::AuthJwtWebToken.new.encode(sub: tenant.id) }
      else
        fail Knock.not_found_exception_class
      end
    end
  end
end
