require 'rails_helper'

RSpec.describe Cart, type: :model do
  fixtures :products
  subject(:cart) { Cart.new }

  let(:product1) { products(:ruby) }
  let(:product2) { products(:one) }

  describe '#add_product' do
    context 'adding the same product multiple times' do
      before do
        cart.add_product(product1).save!
        cart.add_product(product1).save!
      end

      it 'has one line item' do
        expect(cart.line_items.count).to eq(1)
      end

      it 'has line item with  a quantity of 2' do
        expect(cart.line_items.first.quantity).to eq(2)
      end

      it "has a total price of twice the product's price" do
        expect(cart.total_price).to eq(product1.price * 2)
      end
    end

    context 'adding different products' do
      before do
        cart.add_product(product1).save!
        cart.add_product(product2).save!
      end

      it 'has two line items' do
        expect(cart.line_items.size).to eq(2)
      end

      it 'has a total price of the two items price' do
        expect(cart.total_price).to eq(product1.price + product2.price)
      end
    end
  end
end
