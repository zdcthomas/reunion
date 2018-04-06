require 'erb'
require './lib/activity'
require './lib/reunion'
hiking = Activity.new("Hiking")
hiking.add_participant("Bob", 10)
hiking.add_participant("Jane", 15)
hiking.add_participant("Jeff", 2)

reunion = Reunion.new("Denver")
reunion.add_activity(hiking)

output = "This weekend at <%=reunion.location=%>,
 <%=reunion.activities[0].participents=%> went <%=reunion.activities[0].name=%>"

renderer = ERB.new(output)
puts output = renderer.result(binding)

