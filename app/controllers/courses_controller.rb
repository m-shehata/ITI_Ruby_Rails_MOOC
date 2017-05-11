class CoursesController < InheritedResources::Base

  private

    def course_params
      params.require(:course).permit(:title)
    end
end

