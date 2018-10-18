module Api
  module V1
    class CoursesController < Api::V1::ApplicationController
      before_action :find_user, only: :index
      before_action :find_course, only: :show

      def index
        render json: available_course
      end

      def show
        render json: @course
      end

      private

      def available_course
        courses = @user ? @user.available_courses : Course.all
        courses.map { |course| { id: course.id, label: course.label } }
      end
    end
  end
end
