class CommentsController < ApplicationController
  # POST /texts/1/comments
  def create
    @text = Text.find(params[:id])
    if Comment.create({user_id: current_user.id, text_id: @text.id}.merge(comment_params))
      redirect_to @text, notice: 'Comment was successfully posted.'
    else
      redirect_to @text, error: 'Failed to post comment.'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commit_id, :line_number, :body)
    end

    def authenticate!
      raise 'You should be logged in' unless user_signed_in?
    end

end
