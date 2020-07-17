class RelationshipsController < ApplicationController

  before_action :set_create_relationship, only: :create
  before_action :set_destroy_relationship, only: :destroy

  def create
    @relationship.save
      
    respond_to do |format|
      format.html { redirect_to root_path, notice: "You are following #{@follower_user.username}" }
      format.json { head :no_content }
    end
  end

  def destroy  
    @relationship.destroy
    
    respond_to do |format|
      format.html { redirect_to root_path, notice: "You stopped following #{@follower_user.username}" }
      format.json { head :no_content }
    end
  end

  private

  def set_create_relationship
    @relationship = Relationship.new(user_id: current_user.id, follower_id: params[:follower_id])

    @follower_user = User.find(params[:follower_id])
  end

  def set_destroy_relationship
    @relationship = Relationship.where(user_id: current_user, follower_id: params[:user_id]).first

    @follower_user = User.find(params[:user_id])
  end
end
