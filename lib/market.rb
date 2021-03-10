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
        total[item] = Hash.new
      end
    end
    total.each do |key, value|
      value[:vendors] = vendors_that_sell(key)
      sum = 0
      vendors_that_sell(key).each do |vender|
        sum += vendor.check_stock(key)
      end
      value[:quantity] = sum

    end

    total
  end


end
