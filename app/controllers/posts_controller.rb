class PostsController < ApplicationController

  # function :index
  # show post list
  # @return @posts
  def index
    @posts = PostService.getAllPosts
  end

  # function : new
  # show create post page
  # @return @post
  def new
    add_breadcrumb "Add Post", :new_post_posts_path
    @post = Post.new
  end

  # function : new_post
  # post create
  # @return @post_create
  def new_post
    @post = Post.create(post_params)
    @post_create = PostService.createPost(@post)
    if @post_create
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit    
  end

  def update
  end

  def destroy
  end

  private
  # set post parameters
  # @return [<Type>] <description>
  def post_params
    params.require(:post).permit(:title, :description, :public_flag, :created_by, :updated_by)
  end
end
