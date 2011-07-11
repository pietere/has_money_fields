# Introduction

`has_money_fields` is a try to DRY the following code from the Money gem
documentation

```ruby
composed_of :price,
  :class_name => "Money",
  :mapping => [%w(price_cents cents), %w(currency currency_as_string)],
  :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
```

It turns that code it into a smal gem that  you can use yo provide currency
capabilities to fields on your ActiveRecord models.

##  Usage

You can choose whether to store the currency with you "money" or to leave it to
the default you've configured for the gem. For an example `Product` model:

You'll need a migration like this:

```ruby
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :money_price, :default => 0
      t.string :currency_price

      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :products
  end
end
```

And a model like that:

```ruby
class Product < ActiveRecord::Base
  has_money_fields :price
end
```

`money_price` will store the amount and 'currency_price' will store the actual
currency, so, at the end your product will have a `price` field that you can
use like that:

```ruby
p = Product.new :price => Money.new(1000, "EUR"), :name => "T-shirt"

p.price # => #<Money cents:1000 currency:EUR>
p.price.format # => "10.00 €"
p.price.cents # => 1000
p.price.currency_as_string => "€"
```

To use the default currency from the money gem, you'd rather drop the
`currency_price` field from the migration and use `has_money_fields` like that:

```ruby
class Product < ActiveRecord::Base
  has_money_fields :price, :only_cents => true
end
```

# TODO

 * Make dirty attributes and validations work
