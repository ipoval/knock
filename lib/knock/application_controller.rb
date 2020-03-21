module Knock
  class ApplicationController < ActionController::API
    rescue_from(Knock.not_found_exception_class_name) do |exception|
      head :not_found
    end
  end
end
