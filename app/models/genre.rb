class Genre < ApplicationRecord
    has_many :books

    validates :genre, presence: true, length: {maximum: 255},
                      uniqueness: true
end
