require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new("Denver")
    assert_instance_of Reunion, reunion
  end 

  def test_reunion_has_location
    reunion = Reunion.new("Denver")
    assert_equal "Denver", reunion.location
  end 
  
end
