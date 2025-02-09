require 'spec_helper'
require 'pry'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'can initialize' do
    expect(@vendor).to be_a(Vendor)
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
    expect(@vendor.inventory).to eq({})
  end

  describe '#stock' do
    it 'will add an Item object into the Vendors inventory' do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
    end

    it 'will increment the current stock by the amount added' do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      expect(@vendor.inventory).to eq({@item1 => 55})
    end
  end

  describe '#check_stock' do
    it 'will return 0 if an item is not in stock' do
    expect(@vendor.check_stock(@item1)).to eq(0)
    end
    it 'will return the current count of items in stock' do
      @vendor.stock(@item1, 30)
      expect(@vendor.check_stock(@item1)).to eq(30)
    end
  end

  describe '#potential_revenue' do
    it 'will calculate the sum of the price of all items in the inventory * amount' do
      @vendor.stock(@item1, 35)
      @vendor.stock(@item2, 7)
      expect(@vendor.potential_revenue).to eq(29.75)
    end
  end
end