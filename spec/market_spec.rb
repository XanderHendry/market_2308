require 'spec_helper'
require 'pry'

RSpec.describe Market do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @market = Market.new("South Pearl Street Farmers Market")
  end
  it 'can initialize' do
    expect(@market).to be_a(Market)
    expect(@market).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
  end
end