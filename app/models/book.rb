class Book < ApplicationRecord
  has_one :reservation, dependent: :destroy
  has_one :rental, dependent: :destroy
  belongs_to :genre

  validates :title, presence: true, length: { maximum: 255 }
  validates :title_kana, presence: true, length: { maximum: 255 }
  validates :genre_id, presence: true

  scope :order_by_char, -> { order('title_kana COLLATE "C" ASC') }

  def self.search(keyword)
    return Book.all.includes(:genre, :reservation) unless keyword

    Book.where('title like ? OR title_kana like ?', "%#{keyword}%", "%#{keyword}%").includes(:genre, :reservation)
  end
end
