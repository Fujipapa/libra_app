class Book < ApplicationRecord
    has_one :resarvaion
    belongs_to :user
    belongs_to :genre

    validates :title, presence: true, length: {maximum: 255}
    validates :title_kana, presence: true, length: {maximum:255}
    validates :genre_id, presence: true

    def self.search(keyword)
        return Book.all unless keyword
        Book.where("title like ? OR title_kana like ?", "%#{keyword}%","%#{keyword}%")
    end
end
