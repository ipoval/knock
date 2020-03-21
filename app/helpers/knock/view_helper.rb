# frozen_string_literal: true

module Knock
  module ViewHelper
    # Returns meta tags with JWT tokens to be used for safe front-end APIs
    #   <head>
    #     <%= jwt_meta_tags %>
    #   </head>
    #
    def jwt_meta_tag(**options)
      if defined?(jwt_tokens_for_browser) && jwt_tokens_for_browser.present?
        jwt_tokens_for_browser.map { |k, v|
          tag("meta", name: k, content: v)
        }.join("\n").html_safe
      end
    end

    alias jwt_meta_tag jwt_meta_tags
  end
end
