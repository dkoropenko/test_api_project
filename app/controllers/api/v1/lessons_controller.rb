module Api
  module V1
    class LessonsController < Api::V1::ApplicationController
      before_action :find_user, only: :index
      before_action :check_params, only: :index
      before_action :find_lesson, only: :show


      def index
        render json: available_lessons
      end

      def show
        render json: @lesson
      end

      private

      def available_lessons
        return Lesson.all unless @user
        user_lessons
      end

      def check_params
        render json: { error: I18n.t('errors.course_not_specified')} if params[:user_id].present? &&
                                                                        params[:course_id].blank?
      end

      def user_lessons
        available_courses = @user.available_courses.select { |course| course.id == params[:course_id].to_i }

        return [] unless available_courses.present?
        @course = available_courses.first
        @course.lessons.map { |lesson| lesson_data(lesson) }
      end

      def lesson_data(lesson)
        {
          id: lesson.id,
          label: lesson.label,
          description: lesson.description,
          available_to: I18n.l(@course.available_date_to(user: @user))
        }
      end
    end
  end
end
