class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update]
  def index
  end
  def show
    @gossip = Gossip.find(params[:id])
  end
  def new
    @gossip = Gossip.new
  end
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id)

    if @gossip.save
      render :index
    else
      render :new
    end
  end
  def edit
    @gossip = Gossip.find(params[:id])
  end
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.user.id == current_user.id
      if @gossip.update(title: params[:title], content: params[:content])
        render :show
      else
        render :edit
      end
    else
      redirect_to(@gossip)
    end
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.user.id == current_user.id
      if @gossip.destroy
        render :index
      else
        render :show
      end
    else
      redirect_to(@gossip)
    end
  end
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end