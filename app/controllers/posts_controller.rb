class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote]

  def new
    @post = Post.new
  end
  
  def recent
    @recent_posts = Post.recent
    render :recent
  end

  def show
  end

  def create
    @community = Community.friendly.find(params[:community_id])
    @post = @community.posts.create(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @community, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :link, :user_id, :community_id, tag_ids: [], tags_attributes: [:name])
    end
end
