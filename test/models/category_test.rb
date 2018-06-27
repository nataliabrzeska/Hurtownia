require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :categories

  def test_category
    kat = Category.new :name => categories(:kat).name
    assert kat.save

    kat_copy = Category.find(kat.id)
    assert_equal kat.name, kat_copy.name
    assert kat.destroy
  end

end
