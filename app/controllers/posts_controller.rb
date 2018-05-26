class PostsController < UnsecureApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @all_posts = Post.all.order(updated_at: :desc)
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
end
