require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @genre = Genre.new(genre: "デッサン")
    @genre.save
    @book = Book.new(title: "example", title_kana: "エグザンプル", genre_id: @genre.id) 
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "title should not be too long" do
    @book.title = "a" * 256
    assert_not @book.valid?
  end

  test "title should be present" do
    @book.title = ""
    assert_not @book.valid?
  end

  test "title_kana should not be too long" do
    @book.title_kana = "あ" * 256
    assert_not @book.valid?
  end

  test "title_kana should be present" do
    @book.title_kana = ""
    assert_not @book.valid?
  end

end
