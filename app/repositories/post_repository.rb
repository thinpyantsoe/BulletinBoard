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
    end
end