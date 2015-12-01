class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @suggestions = @user.suggestions.most_recent.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def friend
    friend = Friend.new(user_id_1: session[:user_id], user_id_2: params[:user_id_2])
    @redir_friend = User.find(params[:user_id_2])
    if friend.save
      new_friend_text = current_user.name + " is now your friend!"
      notification = Notification.new(user_id: params[:user_id_2], description: new_friend_text)
      notification.save
      redirect_to @redir_friend
    else
      redirect_to @redir_friend#, notice: '... could not be added as your friend at this time.'
    end
  end

  def unfriend
    friend = Friend.where(user_id_1: session[:user_id], user_id_2: params[:user_id_2]).first
    if friend.blank?
      friend = Friend.where(user_id_1: params[:user_id_2], user_id_2: session[:user_id]).first
    end 
    Friend.destroy(friend.id)
    redirect_to User.find(params[:user_id_2])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :provider, :uid, :oauth_token, :oauth_expires_at, :name)
    end
end
