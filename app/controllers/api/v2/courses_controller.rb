module Api
  module V2
    class CoursesController < Api::V2::ApplicationController
      def index
        render json: user.available_courses.map { |course| { id: course.id, label: course.label } }
      end

      def show
        render json: course || render_available_courses_error(params[:course_id] || params[:id])
      end

      def create
        course = Course.new(course_params)

        if course.save
          render json: course, status: :created
        else
          render json: { status: :error, error: course.errors}
        end
      end

      def update
        if course.update(course_params)
          render json: course
        else
          render json: { status: :error, error: course.errors}
        end
      end

      def destroy
        course.destroy
      end

      private

      def course_params
        params.require(:course).permit(:label, :theme)
      end
    end
  end
end
