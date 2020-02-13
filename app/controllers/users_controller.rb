class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @author_gossips = @user.gossips.all
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], city_id: City.all.sample.id)

        if @user.save
            log_in(@user)
            redirect_to root_path
        else
            render :new
        end
    end
end
