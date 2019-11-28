class Book < ApplicationRecord
    validates :title, presence: true, length: {maximum: 255}
    validates :title_kana, presence: true, length: {maximum:255}
    enum status: {可: true, 不可: false}
end
