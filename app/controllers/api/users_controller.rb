module Api
  class UsersController < ApplicationController
    USERS_PER_PAGE = 4

    def index
      @users = User.order(:id).limit(USERS_PER_PAGE).offset(page * 4)
      @total = User.all.count
      render json: {  users: @users,
                      total: @total,
                        per: USERS_PER_PAGE
                    }
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: {errors: @user.errors.full_messages}
      end
    end

    def page
      params["page"].to_i
    end

    def user_params
      params.require(:user).permit(:name, :zawod)
    end
  end
end
