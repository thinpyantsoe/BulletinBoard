class PasswordService
  class << self

    # function :updatePassword
    # action update password
    # @return [<TYpe>]
    def updatePassword(user, password)
      @update_password = PasswordRepository.updatePassword(user, password)
    end
  end
end