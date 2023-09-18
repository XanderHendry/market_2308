class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all { |vendor| vendor.check_stock(item) > 0 }
  end

  def sorted_item_list 
    items = [].flatten
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        items << item.first.name
      end
    end
    items.uniq.sort! 
  end

  def total_inventory
    total_inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |key, value|
        sellers = vendors_that_sell(key)
        total_inventory[key] => {quantity: value, vendors: vendors}
      end
    end
    binding.pry
    total_inventory
  end
end