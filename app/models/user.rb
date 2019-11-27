class User < ApplicationRecord
    before_save {email.downcase!}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                        uniqueness: {case_sensitive: false}, 
                        length: {maximum: 255},
                        format: {with: VALID_EMAIL_REGEX}

    validates :role, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
