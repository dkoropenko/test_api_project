module Api
  module V2
    class ApplicationController < ActionController::API

      private

      def user
        @user ||= User.find_by_id(params[:user_id] || params[:id])
      end

      def course
        @course ||= user.available_courses.select { |course| course.id == (params[:course_id] || params[:id]).to_i }.first
      end

      def lesson
        @lesson ||= Lesson.find(params[:lesson_id] || params[:id])
      end

      def render_error(id)
        { error: I18n.t('errors.field_not_found', kind: controller_name.classify, id: id) }
      end

      def render_available_courses_error(id)
        { error: I18n.t('errors.available_course_not_found', id: id) }
      end
    end
  end
end
