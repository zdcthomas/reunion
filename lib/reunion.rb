# require 'pry'
class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end 

  def total_cost
    sum = 0
    @activities.each do |activity|
      sum += activity.total
    end 
    sum
  end

  def breakdown
    breakdown = Hash.new
    owed = Hash.new
    @activities.each do |activity|
      activity.participants.keys.each do |participant|
        # binding.pry
        owed[participant] = activity.debt(participant)
      end 
      name = activity.name
      breakdown[name] = owed
    end 
    breakdown
  end 
end
