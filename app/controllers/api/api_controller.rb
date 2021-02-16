class Api::ApiController < ApplicationController
  # load_and_authorize_resource
<<<<<<< HEAD

  def set_current_user_unity
    @current_user.set_current_unity(params[:unity_id])
  end
=======
>>>>>>> 43260057bfaeb950becb2f6acccde9c7ef5dcf50

  rescue_from CanCan::AccessDenied do |exception|
    render json: exception.message, status: :unauthorized
  end
end
