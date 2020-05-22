class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = current_item(product)

    if current_item
      current_item.quantity += 1
      current_item.price += product.price
    else
      current_item = line_items.build(product_id: product.id, price: product.price)
    end

    current_item
  end

  def remove_product(product)
    current_item = current_item(product)

    if current_item
      current_item.quantity -= 1
      current_item.price -= product.price
    end

    current_item
  end

  def total_price
    line_items.to_a.sum(&:price)
  end

  private

  def current_item(product)
    line_items.find_by(product_id: product.id)
  end
end
