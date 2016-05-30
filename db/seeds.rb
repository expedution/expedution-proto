require 'nokogiri'
require 'open-uri'

Ressource.delete_all
Activity.delete_all
Day.delete_all
Participation.delete_all
Expedition.delete_all
User.delete_all

t1 = Time.new(2017, 01, 03, 9, 30, 00)
t2 = Time.new(2017, 01, 03, 11, 00, 00)

b = User.create({
    email: "boris@lewagon.org",
    password: "lewagon",
    first_name: "Boris",
    last_name: "Paillard",
    job: "Team Leader",
    company: "Le Wagon",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: true
  })

b1 = User.create({
    email: "yo@yoann.co",
    password: "lewagon",
    first_name: "Yoann",
    last_name: "Lopez",
    job: "Participant",
    company: "Le Wagon",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: false
  })

a = Expedition.new({
  title: "L'Oreal",
  description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.",
  theme: "Tech innovations",
  starts_on: Date.new(2017,01,03),
  ends_on: Date.new(2017,02,07),
  location: "New York City"
  })
a.user = b
a.save

Participation.create(user: b, expedition: a)

d = Day.new({
  position: 1,
  date: Date.new(2017,01,03),
  title: "En route pour L.A."
  })
d.expedition = a
d.save

g = Day.new({
  position: 2,
  date: Date.new(2017,01,04),
  title: "En route pour NYC"
  })
g.expedition = a
g.save



e = Activity.new({
  title: "Space X meeting with innovation team",
  category: "Meeting",
  description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium",
  starts_on: t1,
  ends_on: t2,
  address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
  })
e.day = d
e.save


h = Activity.new({
  title: "Let's go",
  category: "Flight",
  description: "AF N° ...",
  starts_on: t1,
  ends_on: t2,
  address: "Airport CDG"
  })
h.day = d
h.save


i = Activity.new({
  title: "Go to next meeting",
  category: "Transportation",
  description: "jkhkjhkjhjk",
  starts_on: t1,
  ends_on: t2,
  address: "Silicon Valley"
  })
i.day = g
i.save



c = Ressource.new({
  name: "Visited company background",
  category: "Website",
  description: "At vero eos et accusamus et iusto odio dignissimos ducimus",
  url: "www.spacex.com",
  })
c.activity = e
c.save





# response = open("https://angel.co/companies")
# doc = Nokogiri::HTML(response, nil, 'utf-8')
# doc.css('.itemName').each do |element|
#   name = element.search('a').inner_text
#   resource = Resource.create!(name: name)
# end



