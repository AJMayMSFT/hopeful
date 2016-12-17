class GroupsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    group = Group.new(group_params)
    if group.valid?
      group.save
      member = Member.new(user_id:session[:user_id], group_id:group.id)
      puts member
      member.save
    else
      flash[:group_errors]=group.errors.full_messages
    end
    redirect_to "/groups"

  end

  def destroy
    # members = Member.all
    # members.each do |m|
    #   if m.group_id == params[:group_id]
    #     m.delete
    #   end
    # end
    # Member.delete_all('')
    Group.find(params[:group_id]).destroy
    redirect_to '/groups'
  end

  def join
    new_m = Member.new(user_id:session[:user_id], group_id:params[:group_id])
    if new_m.valid?
      new_m.save
    else
      console.log(new_m.errors.full_messages)
    end
    redirect_to "/groups/#{params[:group_id]}"
  end

  def leave
    user = User.find(session[:user_id])
    membership = user.members.find_by(group_id:params[:group_id])
    membership.delete
    redirect_to "/groups/#{params[:id]}"
  end


  private

  def group_params
    params.require(:group).permit(:user_id, :name, :description )
  end
end
