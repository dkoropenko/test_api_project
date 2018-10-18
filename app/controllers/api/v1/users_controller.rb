module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      before_action :find_user, only: :show

      def index
        render json: User.all
      end

      def show
        render json: @user
      end
    end
  end
end
