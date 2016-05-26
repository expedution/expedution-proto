require 'nokogiri'
require 'open-uri'

Ressource.delete_all
Activity.delete_all
Day.delete_all
Expedition.delete_all
User.delete_all


d1 = Date.new(2017,01,04)
d2 = Date.new(2017,11,10)

d0 = Date.new(2017,01,03)

d1 = Date.new(2017,01,03)
d2 = Date.new(2017,02,07)

h1 = DateTime.new(2017,01,03, 13, 30, 0)
h2 = DateTime.new(2017,01,03, 16, 0, 0)

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

d = Day.new({
  position: 1,
  date: d0,
  title: "En route pour L.A."
  })
d.expedition = a
d.save

e = Activity.new({
  title: "Space X meeting with innovation team",
  category: "Meeting",
  description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium",
  starts_on: h1,
  ends_on: h2,
  address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
  })
e.day = d
e.save

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



