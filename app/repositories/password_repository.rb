class PasswordRepository
  class << self
    # function :updatePassword
    # action update password
    # @return [<TYpe>]
    def updatePassword(user, password)
      @update_password = user.update_attribute(:password, password)
    end
  end
end
