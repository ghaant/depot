require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "adding the same product multiple times" do
    cart = Cart.new
    product = products(:ruby)
    line_item = cart.add_product(product)
    line_item.save!
    line_item = cart.add_product(product)
    line_item.save!

    assert_equal 1, cart.line_items.count
    assert_equal product.price * 2, cart.line_items.last.price
  end

  test 'adding different products' do
    cart = Cart.new
    product1 = products(:ruby)
    product2 = products(:one)
    line_item = cart.add_product(product1)
    line_item.save!
    line_item = cart.add_product(product2)
    line_item.save!

    assert_equal 2, cart.line_items.count
    assert_equal product1.price, cart.line_items.first.price
    assert_equal product2.price, cart.line_items.second.price

  end
end
