module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      before_action :resources_for_buying, only: :buy_promo_code

      def index
        render json: User.all
      end

      def show
        render json: user
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

      def buy_promo_code
        user.promo_codes << promo_code
        if user.save
          render json: user, status: :created
        else
          render json: { status: :error, error: user.errors}
        end
      end

      private

      def resources_for_buying
        if @user.nil?
          render json: {
            status: :error,
            error: I18n.t('errors.field_not_found', kind: User, id: params[:user_id])
          }
        elsif @promo_code.nil?
          render json: {
            status: :error,
            error: I18n.t('errors.field_not_found', kind: PromoCode, id: params[:promo_code_id])
          }
        end
      end

      def user_params
        params.require(:user).permit(:first_name, :middle_name, :last_name, :email)
      end

    end
  end
end
