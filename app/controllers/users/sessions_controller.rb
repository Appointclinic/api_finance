# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @user = User.find_by(email: params[:email])

    if !@user.locked_at.present?
      if @user && @user.valid_password?(params[:password])
        token = @user.generate_jwt
        render json: {token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    else
      render json: {error: "Seu login foi bloqueado. Entre em contato com nosso suporte para verificar o que aconteceu"}
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :ok
  end
end
