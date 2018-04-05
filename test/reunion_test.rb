require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha'
require './lib/activity'
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
  
  def test_reunion_begins_with_no_activities
    reunion = Reunion.new("Denver")
    assert_equal [], reunion.activities
  end 

  def test_reunion_can_add_activities
    reunion = Reunion.new("Denver")
    hiking = Activity.new("Hiking")
    reunion.add_activity(hiking)
    assert_equal [hiking], reunion.activities
  end 

end
