class UsersController < ApplicationController
  before_action :authorize_request, except: :create

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    @user = User.find_by_username(params[:username])
    @user ? (render json: @user) : (render json: { errors: 'User not found' })
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    @user = User.find_by_username(params[:username])
    unless @user&.update(user_params)
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  # REMOVE /users/{username}
  def destroy
    @user = User.find_by_username(params[:username])
    unless @user&.destroy
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:avatar, :name, :username, :email, :password, :password_confirmation)
  end
end