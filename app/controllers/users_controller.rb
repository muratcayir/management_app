class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  skip_forgery_protection only: :edit

  def index
    @users = User.page(params[:page]).per(10)
  end

  def search
    query = params[:query]
    @users = if query.present?
               User.where('username ILIKE ?', "%#{query}%").page(params[:page]).per(10)
             else
               User.page(params[:page]).per(10)
             end

    render json: @users
  end

  def edit
    @albums = @user.albums.page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js { render partial: 'users/form', locals: { user: @user } }
    end
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to edit_user_path(@user.username), notice: 'Kullanıcı başarıyla güncellendi.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find_by!(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :phone, :website)
  end
end
