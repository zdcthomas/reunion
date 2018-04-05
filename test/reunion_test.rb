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
    bowling = Activity.new("Bowling")
    reunion.add_activity(hiking)
    assert_equal [hiking], reunion.activities
    reunion.add_activity(bowling)
    assert_equal [hiking, bowling], reunion.activities
    assert reunion.activities[0].participants
    assert reunion.activities[1].participants

  end 

  def test_total_reunion_cost
    reunion = Reunion.new("Denver")
    hiking = Activity.new("Hiking", 30)
    bowling = Activity.new("Bowling", 50)
    assert_equal 0, reunion.total_cost
    reunion.add_activity(hiking)
    reunion.add_activity(bowling)
    assert_equal 80, reunion.total_cost
  end 

  def test_debt_breakdown
    reunion = Reunion.new("Denver")
    hiking = Activity.new("Hiking", 30)
    bowling = Activity.new("Bowling", 30)

    hiking.add_participant("Jane", 5)
    hiking.add_participant("Bob", 10)
    hiking.add_participant("Sam", 13)

    bowling.add_participant("Jane", 15)
    bowling.add_participant("Bob", 5)
    bowling.add_participant("Sam", 20)

    reunion.add_activity(hiking)
    reunion.add_activity(bowling)

    breakdown = reunion.breakdown 
    expected = {"Hiking" => {"Jane" => 5, "Bob" => 0, "Same" => -3}, "Bowling" => {"Jane" => -5, "Bob" => 5, "Sam" => -10}}
    assert_equal expected, breakdown
  end 
end
