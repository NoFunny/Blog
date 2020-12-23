class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render file: Rails.root.join('/public/404.html'), status: :not_found
  end
end
