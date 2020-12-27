class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    render file: Rails.root.join('/public/404.html'), status: :not_found
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render file: Rails.root.join('/public/404.html'), status: :not_found
  end

  def routing_error(_error = 'Routing error', _status = :not_found, _exception = nil)
    render file: Rails.root.join('/public/404.html'), status: :not_found
  end
end
