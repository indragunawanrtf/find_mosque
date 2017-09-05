class Api::V1::UsersController < Api::ApplicationController

  def login
    @user = User.login(params[:username], params[:password])
    if @user
      @user.success_login(request.headers['Device-Id'], request.headers['OS'], request.headers['OS-Version'], request.headers['App-Version'])
      sign_in @user
      render file: '/api/v1/users/success'
    else
      render file: '/api/v1/errors/unauthorized', status: 401
    end
  end

  def logout
    sign_out current_user
    render file: '/api/v1/users/logout'
  end

  def change_password
    if current_user.update_password params[:password], params[:password_confirmation]
      bypass_sign_in current_user
      render file: '/api/v1/users/change_password'
    else
      render file: '/api/v1/errors/unauthorized', status: 401
    end
  end
  
end
