module Api
  module V2
    class LessonsController < Api::V2::ApplicationController
      def index
        render json: user_lessons
      end

      def show
        render json: lesson || params_error(params[:lesson_id] || params[:id])
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

      def user_lessons
        @promo_code = (user.promo_codes & course.promo_codes).first
        return [] unless @promo_code
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
