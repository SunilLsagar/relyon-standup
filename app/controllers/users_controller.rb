class UsersController < ApplicationController

  before_action :require_user
  before_action :check_session

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def show
    @user_post_details =User.where(:name, params[:name])
  end

  def edit

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.name} to Blog App!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile was updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if !@user.admin?
      @user.destroy
      flash[:success] = "User and all associated Posts have been deleted"
      redirect_to users_path
    end
  end

  def user_ajax
    @users=User.all
    respond_to do |format|
      format.json { render json: @users }
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
