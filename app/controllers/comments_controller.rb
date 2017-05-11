class CommentsController < InheritedResources::Base

  def create
    # First way
    # create a comment then push it in the relation
    # @comment = Comment.new(comment_params)
    # @comment.user = current_user
    # @lecture = Lecture.find(params[:lecture_id])
    # @lecture.comments << @comment

    # Second way
    # crate the object directly in the relation then update its user info
    # which will require saving the object
    # @lecture = Lecture.find(params[:lecture_id])     
    # @comment = @lecture.comments.create(comment_params)
    # @comment.user = current_user
    # @comment.save
    
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @lecture = Lecture.find(params[:lecture_id])
    @lecture.comments << @comment
    redirect_to lecture_path(@lecture)
    # @comment.user = current_user
    # # respond_to do |format|
      # if @comment.save
        # format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        # format.json { render :show, status: :created, location: @comment }
      # else
        # format.html { render :new }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      # end
    # end
  end
  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end

