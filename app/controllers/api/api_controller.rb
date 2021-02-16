class Api::ApiController < ApplicationController
  # load_and_authorize_resource

  def set_current_user_unity
    @current_user.set_current_unity(params[:unity_id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: exception.message, status: :unauthorized
  end
end
