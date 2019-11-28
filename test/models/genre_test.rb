require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @genre = Genre.new(genre: "デッサン")
  end

  test "genre should be present" do
    @genre.genre = ""
    assert_not @genre.valid?
  end

  test "genre should not be too long" do
    @genre.genre = "あ" * 256
    assert_not @genre.valid?
  end

  test "genre should unique" do
    duplicate_genre = @genre.dup
    @genre.save
    assert_not duplicate_genre.valid?
  end

end
