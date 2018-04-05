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
    hiking = Activity.new("Hiking")
    hiking.add_participants({"Jane" => 15})
    assert_equal {"Jane" => 15}, hiking.participants
    hiking.add_participants({"Bob" => 10})
    assert_equal {"Jane" => 15, "Bob" => 10}, hiking.participants
  end

  def test_evaluate_total_cost_of_activity
    hiking = Activity.new("Hiking")
    actual = hiking.total
    assert_instance_of Integer, actual
  end

end
