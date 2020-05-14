class AddPriceToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :price, :decimal, precision: 8, scale: 2

    LineItem.all.each do |li|
      li.price = li.product.price * li.quantity
      li.save!
    end
  end
end
