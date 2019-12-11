class User < ApplicationRecord
    has_many :rentals, dependent: :destroy
    has_many :reservations, dependent: :destroy

    before_save {email.downcase!}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                        uniqueness: {case_sensitive: false}, 
                        length: {maximum: 255},
                        format: {with: VALID_EMAIL_REGEX}

    has_secure_password
    validates :password, presence: true, length: {minimum: 6}, allow_nil: true

    enum role:{user: 0, admin: 1}

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
