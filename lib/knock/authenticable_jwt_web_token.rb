# frozen_string_literal: true

module Knock
  module AuthenticableJwtWebToken
    include JwtTokenFromRequest

    # NOTE:
    # before_action :authenticate_with_jwt_web_token

    private

    def authenticate_with_jwt_web_token
      payload = Knock::AuthJwtWebToken.new.decode(jwt_token)
      if payload.blank?
        head(:not_found) and return false
      end

      @current_user = User.find(payload.fetch("sub", ""))
      if @current_user.blank?
        head(:not_found) and return false
      end
    rescue JWT::DecodeError => err
      render_jwt_web_error!(err)
      return false
    end

    def render_jwt_web_error!(err)
      case err
      when JWT::ExpiredSignature
        render json: { errors: ["JWT token has expired"] }, status: :unauthorized
      else
        render json: { errors: ["JWT invalid token"] }, status: :unauthorized
      end
    end
  end
end
