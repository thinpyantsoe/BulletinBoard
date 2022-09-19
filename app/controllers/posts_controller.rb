class PostsController < ApplicationController
  before_action :authorized

  # function :index
  # show post list
  # @return @posts
  def index
    @posts = PostService.getAllPosts(current_user)
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
    @post.user_id = current_user.id
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
    redirect_to posts_path, notice: Messages::POST_DEELTE_SUCCESSFUL
  end

  # function :search
  # search post
  # @return [<Type>]
  def search
    @keyword = params[:keyword]
    @posts = PostService.postSearch(@keyword)
    @old_search_keyword = @keyword
    render :index
  end

  # function :search
  # filter post
  # @return [<Type>]
  def filter
    @filter = params[:filter]
    @user_id = current_user.id
    @posts = PostService.postFilter(@filter, @user_id)
    @old_filter = @filter
    render :index
  end

  # function :download_csv
  # post download csv
  # @return csv_file
  def download_csv
    @posts = PostService.getAllPosts(current_user)
    respond_to do |format|
      format.html
      format.csv { send_data Post.to_csv, filename: "posts-#{DateTime.now.strftime('%d%m%Y')}.csv" }
    end
  end

  # function :csv_format
  # post csv format
  # @return csv format file
  def csv_format
    @post = Post.new
    respond_to do |format|
      format.html
      format.csv { send_data @post.csv_format, filename: 'CSV Format.csv' }
    end
  end

  # function :upload_csv
  # post csv upload
  # @return csv upload
  def upload_csv; end

  # function :import_csv
  # post import csv
  # @return [<Type>]
  def import_csv
    if params[:file].nil?
      redirect_to upload_csv_posts_path, notice: Messages::REQUIRE_FILE_VALIDATION
    else
      Post.import(params[:file], current_user.id)
      redirect_to posts_path, notice: Messages::UPLOAD_SUCCESSFUL #=> or where you want
    end
  end

  private

  # set post parameters
  # @return [<Type>] <description>
  def post_params
    params.require(:post).permit(:title, :description, :public_flag, :user_id)
  end
end
