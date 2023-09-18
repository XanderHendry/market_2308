require 'spec_helper'
require 'pry'

RSpec.describe Market do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @market = Market.new("South Pearl Street Farmers Market")
  end
  it 'can initialize' do
    expect(@market).to be_a(Market)
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
  end

  describe '#add_vendor' do
    it 'will add a Vendor to the Markets vendor array' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      expect(@market.vendors).to eq([@vendor1, @vendor2])
    end
  end
end