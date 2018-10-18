module Api
  module V2
    class UsersController < Api::V2::ApplicationController

      def index
        render json: User.all
      end

      def show
        render json: user || render_error(params[:user_id] || params[:id])
      end
    end
  end
end
