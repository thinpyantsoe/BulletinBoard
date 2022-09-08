class PostService
    class << self
        # function :getAllPosts
        # get all posts
        # @return @posts
        def getAllPosts
            @posts = PostRepository.getAllPosts
        end

        # function :createPost
        # post create
        # @param [<Type>] post <description>
        # @return [<Type>] <description>
        def createPost(post)
            @post_create = PostRepository.createPost(post)
        end

        # function :getPostByID
        # get post
        # @param [<Type>] id <description>
        # @return [<Type>] <description>
        def getPostByID(id)
            @post = PostRepository.getPostByID(id)
        end

        # function :updatePost
        # @return [<Type>] <description>
        def updatePost(post, post_params)
            @post_update = PostRepository.updatePost(post, post_params)
        end

        # function :postDestroy
        # @return [<Type>] <description>
        def postDestroy(post)
            PostRepository.postDestroy(post)
        end
    end
end