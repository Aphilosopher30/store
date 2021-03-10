class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) > 0
    end
  end

  def total_inventory
    total = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        total[item] = Hash.new(0)
      end
    end
    total.each do |key, value|
      total[key][:vendors] = vendors_that_sell(key)
      total[key][:quantity] = vendors_that_sell(key).sum do |vender|
        vendor.check_stock(key)
      end

    end
    total
  end


end
