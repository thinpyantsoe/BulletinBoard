class PostRepository
  class << self
    # function :getAllPosts
    # get all posts
    # @return @posts
    def getAllPosts(current_user)
      @posts = Post.where(user_id: current_user.id).order('id ASC')
    end

    # function :createPost
    # post create
    # @param [<Type>] post <description>
    # @return [<Type>] <description>
    def createPost(post)
      @post_create = post.save
    end

    # function :getPostByID
    # get post by post id
    # @param [<Type>] id <description>
    # @return [<Type>] <post>
    def getPostByID(id)
      @post = Post.find(id)
    end

    # function :updatePost
    # @return [<Type>] <description>
    def updatePost(post, post_params)
      @post_update = post.update(post_params)
    end

    # function :postDestory
    # @return [<Type>] <description>
    def postDestroy(post)
      post.destroy
    end

    # function :postSearch
    #
    # @return [<Type>] <description>
    def postSearch(keyword)
      @posts = Post.where('title LIKE ?', "%#{keyword}%")
    end

    # function :postFilter
    #
    # @return [<Type>] <description>
    def postFilter(filter, current_user_id)
      Rails.logger.info filter
      case filter
      when '1'
        @posts = Post.all.order('id ASC')
      when '2'
        @posts = Post.where(user_id: current_user_id).order('id ASC')
      when '3'
        @posts = Post.where.not(user_id: current_user_id).order('id ASC')
      end
    end
  end
end
