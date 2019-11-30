class Genre < ApplicationRecord
    belongs_to :genre

    validates :genre, presence: true, length: {maximum: 255},
                      uniqueness: true
end
