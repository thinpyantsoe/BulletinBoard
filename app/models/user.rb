class User < ApplicationRecord
    before_save :email_downcase 
    validates :name, presence: true
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: Constants::VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }
    validates :password, confirmation: true, presence: true, on: :create
    validates :phone, numericality: true, length: { minimum: 9, maximum: 12 },
                allow_blank: true
    validates :address, length: {maximum: 255}, allow_blank: true
    validates_inclusion_of :super_user_flag, :in => [true, false]
    validates :birthday, format: { with: Constants::VALID_DATE_FORMAT },
                allow_blank: true

    has_secure_password

    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver # This sends an e-mail with a link for the user to reset the password
    end

    # This generates a random password reset token for the user
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

    private
 
    def email_downcase
      self.email = email.downcase
    end
end
