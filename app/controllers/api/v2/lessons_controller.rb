module Api
  module V2
    class LessonsController < Api::V2::ApplicationController
      def index
        render json: course.lessons.map { |lesson| lesson_data(lesson) }
      end

      def show
        render json: lesson || render_error(params[:lesson_id] || params[:id])
      end

      private

      def lesson_data(lesson)
        {
          id: lesson.id,
          label: lesson.label,
          description: lesson.description,
          available_to: I18n.l(course.available_date_to(user: user))
        }
      end
    end
  end
end
