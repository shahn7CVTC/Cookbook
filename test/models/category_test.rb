require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Checking for valid Category Name" do
    category = Category.new
    category.name = "Beverage"
    assert category.save
  end
end
