class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
