class User < ApplicationRecord
    has_many :books
    has_many :resarvation
    
    before_save {email.downcase!}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                        uniqueness: {case_sensitive: false}, 
                        length: {maximum: 255},
                        format: {with: VALID_EMAIL_REGEX}

    validates :role, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
