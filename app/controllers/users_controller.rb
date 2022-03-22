class UsersController < ApplicationController
  before_action :authenticate_request!, except: :create
  before_action :find_user, except: %i[create index show]

  def create
    @user = User.new parameter
    if @user.save
      render json: payload(@user), status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find_by_username! params[:_username]
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def parameter
    params.permit :name, :username, :password, :password_confirmation
  end

  def payload(user)
    return nil unless user and user.id
    {
      access_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, name: user.name}
    }
  end
end
