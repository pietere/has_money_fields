require "spec/spec_helper"

describe "Model with money fields" do
  context "for cents and currency" do
    before do
      @product = Product.new :price => Money.new(1000, "EUR"),
        :name => "Ruby T-shirt"
    end
    subject { @product }

    its(:money_price) { should == 1000 }
    its(:currency_price) { should eq("EUR") }
    its(:price) { should == Money.new(1000, "EUR") }
  end

  context "only for cents" do
    before do
      @product = Product.create! :price_in_usd => Money.new(1000),
        :name => "Ruby T-shirt"
    end
    subject { @product }

    it "doesn't have a stored currency" do
      @product.respond_to?(:currency_price_in_usd).should be_false
    end

    its(:money_price_in_usd) { should == 1000 }
    its(:price_in_usd) { should == Money.new(1000, "USD") }
  end
end
