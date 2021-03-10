require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test


  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    inventory = {}

    assert_equal "Rocky Mountain Fresh" , vendor.name
    assert_equal inventory, vendor.inventory
  end

  def test_check_stalk
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, vendor.check_stalk("item")
  end

  def test_stalk
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    inventory = {item1 => 30}

    assert_equal 30, vendor.stalk(item1, 30)
    assert_equal inventory, vendor.inventory
  end



end
