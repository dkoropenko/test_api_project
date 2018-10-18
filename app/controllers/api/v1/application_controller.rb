module Api
  module V1
    class ApplicationController < ActionController::API

      private

      def find_user
        id = params[:user_id] || params[:id]
        @user ||= User.find_by(id: id)
      end

      def find_course
        id = params[:course_id] || params[:id]
        @course ||= Course.find_by(id: id)
      end

      def find_lesson
        @lesson ||= Lesson.find(params[:id])
      end
    end
  end
end
