class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update ,:destroy, :password_edit, :password_update]
  before_action :redirect_if_not_logged_in, only: [:index, :show, :edit, :update, :destroy, :password_edit, :password_update]
  before_action :redirect_if_not_admin_or_owner, only: [:index, :show, :edit, :update, :destroy, :password_edit, :password_update]

  def index
    if params[:event_id]
      @users = Event.find_by(id: params[:event_id]).users.order(:name)
    else
      @users = User.order(:name)
    end
  end

  def show    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @alert = "Sign up failed..."
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.admin = params[:user][:admin]
    if @user.save
      redirect_to @user
    else
      @alert = "Update failed..."
      @errors = @user.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def password_edit
  end

  def password_update
    if params[:user][:password].empty?
      @user.errors.add(:password, message: "must not be blank.")
      @alert = "Password could not be changed."
      @errors = @user.errors.full_messages
      render 'password_edit'
    else
      @user.update(password_params)
      if @user.errors.present?
        @alert = "Password could not be changed."
        @errors = @user.errors.full_messages
        render 'password_edit'
      else
        redirect_to @user, alert: "Password successfully changed."
      end
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
