require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_has_name
    hiking = Activity.new("Hiking")
    assert_equal "Hiking", hiking.name
  end

  def test_activity_starts_with_no_participants
    activity = Activity.new("Bowling")
    assert_instance_of Hash, activity.participants
    assert activity.participants.empty?
  end

  def test_add_participants_to_activity
    
    hiking = Activity.new("Hiking", 30)
    hiking.add_participant("Jane", 15)
    assert_equal ({"Jane" => 15}), hiking.participants
    hiking.add_participant("Bob", 10)
    assert_equal ({"Jane" => 15, "Bob" => 10}), hiking.participants
  end

  def test_evaluate_total_cost_of_activity
     
    hiking = Activity.new("Hiking", 30)
    actual = hiking.total
    assert_equal 30, actual
  end

  def test_split_cost_of_activity
    hiking = Activity.new("Hiking", 30)
    hiking.add_participant("Bob", 10)
    hiking.add_participant("Jane", 15)
    actual = hiking.split_cost
    assert_equal 15, actual
    hiking.add_participant("Jeff", 2)
    actual = hiking.split_cost
    assert_equal 10, actual
  end 

  def test_debts_returns_who_is_owed_what
    
    hiking = Activity.new("Hiking", 30)
    hiking.add_participant("Jeff", 2)
    hiking.add_participant("Jane", 15)
    hiking.add_participant("Bob", 10)
    assert_equal 10, hiking.split_cost
    assert_equal -5, hiking.debt("Jane")
    assert_equal 8, hiking.debt("Jeff")
    assert_equal 0, hiking.debt("Bob")
  end 

end
