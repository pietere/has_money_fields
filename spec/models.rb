ActiveRecord::Schema.define(:version => 1) do
  create_table :products do |t|
    t.integer :money_price, :default => 0
    t.string :currency_price

    t.integer :money_price_in_usd, :default => 0

    t.string :name, :null => false
  end
end

class Product < ActiveRecord::Base
  has_money_fields :price
  has_money_fields :price_in_usd, :only_cents => true
end
