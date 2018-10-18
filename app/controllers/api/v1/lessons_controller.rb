module Api
  module V1
    class LessonsController < Api::V1::ApplicationController
      before_action :check_params, only: :index

      def index
        render json: available_lessons
      end

      def show
        render json: lesson
      end

      def create
        lesson = Lesson.new(lesson_params)

        if lesson.save
          render json: lesson, status: :created
        else
          render json: { status: :error, error: lesson.errors}
        end
      end

      def update
        if lesson.update(lesson_params)
          render json: lesson
        else
          render json: { status: :error, error: lesson.errors}
        end
      end

      def destroy
        lesson.destroy
      end

      private

      def lesson_params
        params.require(:lesson).permit(:course_id, :label, :description)
      end

      def available_lessons
        return Lesson.all unless user
        user_lessons
      end

      def check_params
        render json: { error: I18n.t('errors.course_not_specified')} if params[:user_id].present? &&
                                                                        params[:course_id].blank?
      end

      def user_lessons
        available_courses = user.available_courses.select { |c| c.id == course.id }

        return [] unless available_courses.present?
        @promo_code = (user.promo_codes & course.promo_codes).first
        course.lessons.take(@promo_code.lessons_size).map { |lesson| lesson_data(lesson) }
      end

      def lesson_data(lesson)
        {
          id: lesson.id,
          label: lesson.label,
          description: lesson.description,
          available_to: I18n.l(@promo_code.end_date)
        }
      end
    end
  end
end
