class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stalk(item)
    @inventory[item]
  end

  def stalk(item, number)
    @inventory[item] += number
  end

end
