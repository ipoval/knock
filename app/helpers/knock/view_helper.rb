# frozen_string_literal: true

module Knock
  module ViewHelper
    # Returns a meta tag with JWT token to be used for safe front-end APIs
    #   <head>
    #     <%= jwt_meta_tag %>
    #   </head>
    #
    def jwt_meta_tag(**options)
      if allow_jwt_meta_tag?
        options[:name] ||= "jwt-token-frontend"
        options[:content] ||= ""
        tag("meta", options)
      end
    end

    def allow_jwt_meta_tag?
      @allow_jwt_meta_tag.present?
    end
  end
end
