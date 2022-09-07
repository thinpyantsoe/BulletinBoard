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
    end
end