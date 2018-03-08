class CommunitiesController < ApplicationController
  before_action :set_community, only: [ :show, :edit, :update, :destroy, :next ]

  def index
    @communities = Community.by_created_at
    respond_to do |format|
      format.html { @communities }
      format.json { render json: @communities }
    end
  end

  def show
    respond_to do |format|
      format.html { @community }
      format.json { render json: @community }
    end
  end

  def next
    @next_community = @community.next
    render json: @next_community
  end

  def new
    @community = current_user.communities.build
  end

  def edit
  end

  def create
    @community = current_user.communities.build(community_params)

    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.id == @community.user_id
      @community.destroy

      respond_to do |format|
        format.html { redirect_to communities_url, notice: 'Community was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_community
      @community = Community.find(params[:id])
    end

    def community_params
      params.require(:community).permit(:title, :short_description)
    end
end
