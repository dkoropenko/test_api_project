module Api
  module V1
    class CoursesController < Api::V1::ApplicationController
      def index
        render json: available_course
      end

      def show
        render json: course
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

      def available_course
        courses = user ? user.available_courses : Course.all
        courses.map { |course| { id: course.id, label: course.label } }
      end
    end
  end
end
