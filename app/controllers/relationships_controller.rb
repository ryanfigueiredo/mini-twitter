class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow!(@user)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "You are following #{@user.username}" }
      format.json { head :no_content }
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "You stopped following #{@user.username}" }
      format.json { head :no_content }
    end
  end
end
