class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, amount)
    if @inventory[item].nil?
      @inventory[item] = amount
    else
      @inventory[item] += amount
    end
  end

  def check_stock(item)
    if @inventory[item].nil?
      0
    else
      @inventory[item]
    end
  end

  def potential_revenue
    totals = []
    @inventory.each do |key, value|
      price = key.price.tr('$', '').to_f
      totals << price * value
    end
    totals.sum
  end
end