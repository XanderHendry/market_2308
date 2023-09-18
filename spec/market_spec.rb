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
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @vendor3.stock(@item1, 65)
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

  describe "#vendor_names" do
    it 'will list the names of all the vendors in the market' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom"])
    end
  end
  
  describe '#vendors_that_sell' do
    it 'will return a list of vendors that have an item in stock' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end

  describe '#sorted_item_list' do
    it 'will return an array of the item names the vendors have in stock, alphabetically' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", 'Peach', "Peach-Raspberry Nice Cream", 'Tomato'])
    end
  end

  describe '#total_inventory' do
    it 'will return a hash with `Item` objects as keys and hashes as their values' do
      @market.add_vendor(@vendor3)
      expect(@market.total_inventory).to eq({@item1 => {quantity: 100, vendors: [@vendor1, @vendor3]}})
    end
  end

  describe '#overstocked_items' do
    it "will return an array of all items that are sold by more than one vendor AND have a total quantity greater than 50" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.overstocked_items).to eq([@item1])
    end
  end
end