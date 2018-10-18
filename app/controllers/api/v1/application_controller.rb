module Api
  module V1
    class ApplicationController < ActionController::API

      private

      def user
        @user ||= User.find_by(id: params[:user_id] || params[:id])
      end

      def course
        @course ||= Course.find_by(id: params[:course_id] || params[:id])
      end

      def lesson
        @lesson ||= Lesson.find(params[:id])
      end

      def promo_code
        @promo_code ||= PromoCode.find(params[:promo_code_id] || params[:id])
      end
    end
  end
end
