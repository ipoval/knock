# frozen_string_literal: true

module Knock
  module ApiTenantToken
    private

    def get_api_tenant
      @api_tenant ||= User.find_by(subdomain: request.subdomains.first)
    end

    # NOTE: before_action :authenticate_with_tenant_api_token
    def authenticate_with_tenant_api_token
      case request.format
      when Mime[:json], Mime[:xml], Mime[:atom]
        if tenant = authenticate_with_http_token { |t, o| get_api_tenant.authenticate_with_api_tenant_token(t, o) }
          @current_user = tenant
        else
          request_http_token_authentication
        end
      else
        if session_authenticated?
          @current_user = @api_tenant.users.find(session[:authenticated][:user_id])
        else
          redirect_to(login_url) and return false
        end
      end
    end
  end
end
