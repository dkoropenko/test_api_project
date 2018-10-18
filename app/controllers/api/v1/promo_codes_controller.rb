module Api
  module V1
    class PromoCodesController < Api::V1::ApplicationController
      def index
        render json: PromoCode.all
      end

      def show
        render json: promo_code
      end

      def create
        promo_code = PromoCode.new(promo_code_params)

        if promo_code.save
          render json: promo_code, status: :created
        else
          render json: { status: :error, error: promo_code.errors}
        end
      end

      def update
        if promo_code.update(promo_code_params)
          render json: promo_code
        else
          render json: { status: :error, error: promo_code.errors}
        end
      end

      def destroy
        promo_code.destroy
      end

      private

      def promo_code_params
        params.require(:promo_code).permit(:course_id, :identifier, :lessons_size, :days)
      end
    end
  end
end
