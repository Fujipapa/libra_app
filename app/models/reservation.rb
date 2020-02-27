class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book_id, uniqueness: true

  # user以外のユーザによるbookの予約データを返す
  def self.of_other(user, book)
    where.not(user: user).find_by(book: book)
  end
end
