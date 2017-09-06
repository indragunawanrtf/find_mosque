class Api::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def get_user
  	@user = User.find_by_access_token(request.headers['Access-Token'])
    if @user.blank?
      render file: 'api/v1/errors/invalid_access_token'
    else
      sign_in @user if current_user.blank?
    end
  end
end