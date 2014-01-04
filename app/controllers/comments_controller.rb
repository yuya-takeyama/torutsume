class CommentsController < ApplicationController
  # POST /texts/1/comments
  def create
    @text = Text.find(params[:id])
    comment = Comment.create({user_id: current_user.id, text_id: @text.id}.merge(comment_params))

    if comment.save
      redirect_to @text, notice: 'Comment was successfully posted.'
    else
      redirect_to @text, alert: 'Failed to post comment.'
    end
  end

  private
    def comment_params
      p = params.require(:comment).permit(:commit_id, :line_number, :body)
      p.merge(body: Dee['util.text_normalizer'].normalize_multiple_lines(p[:body]))
    end

    def authenticate!
      raise 'You should be logged in' unless user_signed_in?
    end

end
