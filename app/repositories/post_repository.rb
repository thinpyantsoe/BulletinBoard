class PostRepository
    class << self
        # function :getAllPosts
        # get all posts
        # @return @posts
        def getAllPosts
            @posts = Post.all.order('id ASC')
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
    end
end