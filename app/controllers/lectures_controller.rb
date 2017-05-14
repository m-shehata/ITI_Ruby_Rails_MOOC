class LecturesController < InheritedResources::Base
load_and_authorize_resource
  # def show
  # @comment = Comment.new
  # end
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user = current_user
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    authorize! :upvote, Lecture
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_by current_user
    redirect_to :back
  end

  def downvote
    authorize! :downvote, Lecture
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_by current_user
    redirect_to :back
  end

  private

  def lecture_params
    params.require(:lecture).permit(:title, :content, :attachment, :course_id, :user_id)
  end
end

