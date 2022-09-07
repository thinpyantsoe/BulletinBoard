class UserService
    class << self
        # function :getAllUsers
        # get all users
        # @return @users
        def getAllUsers
            @users = UserRepository.getAllUsers
        end

        # function :createUser
        # user create
        # @param [<Type>] user <description>
        # @return [<Type>] <description>
        def createUser(user)
            @user_create = UserRepository.createUser(user)
        end

        # function getUserByID
        # get user by user id
        # @param [<Type>] id <description>
        # @return [<Type>] <user>
        def getUserByID(id)
            @users = UserRepository.getUserByID(id)
        end

        # function :updateUser
        # update user
        # @param [<Type>] user <description>
        # @param [<Type>] user_params <description>
        # @return [<Type>] <description>
        def updateUser(user, user_params)
            @user_update = UserRepository.updateUser(user, user_params)
        end

        # function :destroyUser
        # delete user
        # @param [<Type>] user <description>
        # @return [<Type>] <description>
        def destroyUser(user)
            UserRepository.destroyUser(user)
        end

        def findByEmail(email)
            @user = UserRepository.findByEmail(email)
        end
    end
end