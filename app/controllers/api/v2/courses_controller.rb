module Api
  module V2
    class CoursesController < Api::V2::ApplicationController
      def index
        render json: user.available_courses.map { |course| { id: course.id, label: course.label } }
      end

      def show
        render json: course || render_available_courses_error(params[:course_id] || params[:id])
      end
    end
  end
end
