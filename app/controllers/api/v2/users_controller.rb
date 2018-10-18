module Api
  module V2
    class UsersController < Api::V2::ApplicationController

      def index
        render json: User.all
      end

      def show
        render json: user || params_error(params[:user_id] || params[:id])
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created
        else
          render json: { status: :error, error: user.errors}
        end
      end

      def update
        if user.update(user_params)
          render json: user
        else
          render json: { status: :error, error: user.errors}
        end
      end

      def destroy
        user.destroy
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :middle_name, :last_name, :email)
      end
    end
  end
end
