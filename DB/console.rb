require_relative('../MODELS/bounty.rb')

bounty1 = Bounty.new({
  name: "Yosemite Sam",
  bounty_value: 200,
  danger_level: "high",
  favourite_weapon: "dual pistols"
})

bounty1.save()
p bounty1.find(3)
