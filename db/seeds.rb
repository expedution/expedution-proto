d1 = Date.new(2017,01,04)
d2 = Date.new(2017,11,10)

b = User.create({
    email: "boris@lewagon.org",
    password: "lewagon",
    first_name: "Boris",
    last_name: "Paillard",
    job: "Teal Leader",
    company: "Le Wagon",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: true
  })

a = Expedition.new({
  title: "L'Oreal",
  description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.",
  theme: "Tech innovations",
  starts_on: d1,
  ends_on: d2,
  location: "New York City"
  })
a.user = b
a.save


