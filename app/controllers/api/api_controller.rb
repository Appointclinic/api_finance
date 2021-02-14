class Api::ApiController < ApplicationController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    render json: exception.message, status: :unauthorized
  end
end
