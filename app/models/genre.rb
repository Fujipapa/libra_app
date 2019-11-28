class Genre < ApplicationRecord
    validates :genre, presence: true, length: {maximum: 255},
                      uniqueness: true
end
