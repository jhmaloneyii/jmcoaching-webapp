class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  # GET /tags/1
  # GET /tags/1.json
  def show
    @posts = @tag.posts.paginate(page: params[:page], per_page: 5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end
end
