class Activity
  attr_reader :name,
              :total,
              :participants
  def initialize(name)
    @name = name
    @total = 0
    @participants = Hash.new
  end 

  def add_participant(name, cost)
    @participants[name] = cost
  end 
end
