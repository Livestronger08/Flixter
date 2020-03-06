class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_lesson.section.course, only: [:show]
    def show
    end

    private

    def require_authorized_for_current_lesson_section_course
        if current_lesson.section.course != current_user.enrolled_in?
            redirect_to lesson_path, alert: 'Unauthorized'
        end
    end 

    helper_method :current_lesson
    def current_lesson
        @current_lesson ||= Lesson.find(params[:id])
    end
end
