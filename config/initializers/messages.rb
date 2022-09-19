module Messages
  # user login validations message
  INVALID_EMAIL_OR_PASSWORD = 'Email or password is invalid.'
  EMAIL_REQUIRE_VALIDATION = 'Email is required.'
  PASSWORD_REQUIRE_VALIDATION = 'Password is required.'
  EMAIL_AND_PASSWORD_REQUIRE_VALIDATION = 'Both Email and Password are required.'
  USER_DELETE_SUCCESSFUL = 'User has been deleted.'
  POST_DEELTE_SUCCESSFUL = 'Post has been deleted.'

  # password change message
  PASSWORD_AND_CONFIRM_PASSWORD_NOT_THE_SAME = 'Password and Confirm Password must be the same.'
  PASSWORD_AND_CONFIRM_PASSWORD_REQUIRED = 'Both Password and Confirm Password are required.'
  PASSWORD_CONFIRMATION_REQUIRED = 'Password Confirm Password is required.'

  # password reset message
  EMAIL_NOT_EXIST = 'Email address not found. Please check.'
  PASSWORD_RESET_SENT = 'Email send with password reset instructions.'
  PASSWORD_RESET_URL_EXPIRED = 'The URL you accessed has expired.'
  URL_INCORRECT = 'The URL you accessed is incorrect.'
  PASSWORD_RESET_COMPLETE = 'Password reset is completed.'

  # csv file validation message
  REQUIRE_FILE_VALIDATION = 'Please choose a file.'
  UPLOAD_SUCCESSFUL = 'CSV file uploaded is successfully.'
end
