class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def index
    @post = Post.find(params[:post_id])
    render json: @post.comments
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.id == @comment.user_id
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to community_post_path(@comment.post.community, @comment.post), notice: 'Comment was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
