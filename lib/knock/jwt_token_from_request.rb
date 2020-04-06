# frozen_string_literal: true

module Knock
  module JwtTokenFromRequest
    private

    def jwt_token
      params[:jwt_token] || request.headers["Authorization"]&.split&.last
    end
  end
end
