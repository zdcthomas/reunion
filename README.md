# Reunion

## Preparation

1. Fork this repository.
1. Clone your new repository to your local machine.
1. Run `bundle` from the command line.
1. Run `rake` from the command line.

## Tasks

We're developing a small application to split expenses after a group of friends get together for a reunion. This will track how much each person spent on a particular activity, how much each person owed, and ultimately print out a summary of how much each person owes or is owed.

Use tests to drive your development.

### Iteration 1: Creating Activities

Add to the existing Activity class so that it supports the interaction pattern below.

```ruby
> require './lib/activity'
# => true

> activity = Activity.new("Brunch")
# => #<Activity:0x007fe4ca1df568 ...>

> activity.name
# => "Brunch"

> activity.participants
# => {}

> activity.add_participant("Jim", 20)
> activity.participants
# => {"Jim" => 20}

> activity.total_cost
# => 20

> activity.add_participant("Joe", 40)
> activity.participants
# => {"Jim" => 20, "Joe" => 40}
```

### Iteration 2: Activity Calculations

Add to the Activity class so that it supports the following interaction pattern. Note, it is assumed that the cost of each activity is split evenly between all participants.

If a participant paid less than their fair share they owe a positive amount.

If a participant paid more than their fair share they owe a negative amount (meaning they are owed money).

```ruby
> require './lib/activity'
# => true

> activity = Activity.new("Brunch")
# => #<Activity:0x007fe4ca1df568 ...>

> activity.add_participant("Jim", 20)
> activity.add_participant("Joe", 40)

> activity.total_cost
# => 60

> activity.split
# => 30

> activity.owed
# => {"Jim" => 10, "Joe" => -10}
```

### Iteration 3: Creating Reunions

Add to the existing Reunion class so that it supports the interaction pattern below.

```
> require './lib/reunion'
# => true

> reunion = Reunion.new("Denver")
# => #<Reunion:0x007fe4ca1defc8 ...>

> reunion.name
# => "Denver"

> reunion.activities
# => []

> activity_1 = Activity.new("Brunch")
# => #<Activity:0x007fe4ca1d9438 ...>

> activity_1.add_participant("Jim", 20)
> activity_1.add_participant("Joe", 40)
> reunion.add_activity(activity_1)
> reunion.activities
# => [#<Activity:0x007fe4ca1d9438 ...>]
```

### Iteration 4: Reunion Calculations

Add to the existing Reunion class so that it supports the interaction pattern below.

```
> require './lib/reunion'
# => true

> reunion = Reunion.new("Denver")
# => #<Reunion:0x007fe4ca1defc8 ...>

> activity_1 = Activity.new("Brunch")
> activity_1.add_participant("Jim", 20)
> activity_1.add_participant("Joe", 40)
> reunion.add_activity(activity_1)
> reunion.total_cost
# => 60

> activity_2 = Activity.new("Drinks")
> activity_2.add_participant("Jim", 60)
> activity_2.add_participant("John", 80)
> reunion.add_activity(activity_2)
> reunion.total_cost
# => 200

> reunion.breakout
# => {"Jim"=> 20, "Joe"=> -10, "John"=> -10}

> reunion.print_summary
Jim: 20
Joe: -10
John: -10
```

### Iteration 5: ERB

Research ERB. Create a template for a webpage using HTML and ERB that will display important details of a Reunion. Create a runner file to create a Reunion with Activities, and use the template to generate an HTML page that you can open in your browser.
