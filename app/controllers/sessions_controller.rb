class SessionsController < ApplicationController
  def create
    user = User.find_by username: params[:username]

    if user && user.authenticate(parameter[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def parameter
    params.permit :username, :password
  end

  def payload(user)
    return nil unless user && user.id
    {
      access_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, name: user.name}
    }
  end
end
