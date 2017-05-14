class CoursesController < InheritedResources::Base
load_and_authorize_resource
  private

    def course_params
      params.require(:course).permit(:title)
    end
end

