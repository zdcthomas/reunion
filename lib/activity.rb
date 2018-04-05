class Activity
  attr_reader :name,
              :total,
              :participants
  def initialize(name, cost = 0)
    @name = name
    @total = cost
    @participants = Hash.new
  end 

  def add_participant(name, cost)
    @participants[name] = cost
  end 
  
  def split_cost
    unless @participants.empty?
      @total/@participants.keys.count
    end 
  end 

  def debt(name)
    paid = @participants[name]
    owed = split_cost - paid
  end 
  
end
