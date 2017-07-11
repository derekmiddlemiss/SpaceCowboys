require_relative('../MODELS/bounty.rb')

bounty1 = Bounty.new({
  name: "Yosemite Sam",
  bounty_value: 200,
  danger_level: "high",
  favourite_weapon: "dual pistols"
})

bounty2 = Bounty.new({
  name: "Desperate Dan",
  bounty_value: 300,
  danger_level: "high",
  favourite_weapon: "cow pie"
})

bounty3 = Bounty.new({
  name: "Mildly Menacing Michael",
  bounty_value: 10,
  danger_level: "low",
  favourite_weapon: "disarming honesty"
})

bounty1.save()
bounty2.save()
bounty3.save()

# p Bounty.find(1)

p Bounty.most_wanted(100)

