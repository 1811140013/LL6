class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end
  
  def create
    @user = User.new(uid: params[:uid],pass: [:pass])
    @user.pass = BCrypt::Password.create(params[:pass])
    #pass = BCrypt::Password.create(params[:user][:pass])
    #@user = User.new(uid: params[:user][:uid],pass: pass)
    if @user.save
      flash[:info] = "登録しました"
      redirect_to users_path
    else
      @user.pass = ""
      render :new
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:info] = "削除しました"
    redirect_to users_path
  end
end
