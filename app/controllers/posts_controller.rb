class PostsController < ApplicationController

  # function :index
  # show post list
  # @return @posts
  def index
    @posts = PostService.getAllPosts
  end

  # function :new
  # show create post page
  # @return @post
  def new
    @post = Post.new
  end

  # function :new_post
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

  # function :edit
  # edit post
  # @return @post
  def edit
    @post = PostService.getPostByID(params[:id])
  end

  # function :update
  # update post
  # @return @post
  def update
    @post = PostService.getPostByID(params[:id])
    @post_update = PostService.updatePost(@post, post_params)
    if @post_update
      redirect_to posts_path
    else
      render :edit
    end
  end

  # function :destroy
  # delete post
  # @return [<Type>]
  def destroy
    @post = PostService.getPostByID(params[:id])
    PostService.postDestroy(@post)
    flash[:notice] = "Post has been deleted"
    redirect_to posts_path
  end

  private
  # set post parameters
  # @return [<Type>] <description>
  def post_params
    params.require(:post).permit(:title, :description, :public_flag, :created_by, :updated_by)
  end
end
