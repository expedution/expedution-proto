require 'nokogiri'
require 'open-uri'
require 'faker'

Ressource.delete_all
Activity.delete_all
Day.delete_all
Invitation.delete_all
Participation.delete_all
Expedition.delete_all
User.delete_all



organiser = User.create!({
    email: "followtheguide@gmail.com",
    password: "lewagon",
    first_name: "Michael",
    last_name: "Magic",
    job: "Team Leader",
    company: "Le Wagon",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: true
  })

t1 = Time.new(2017, 01, 03, 9, 30, 00)
t2 = Time.new(2017, 01, 03, 11, 00, 00)
t3 = Time.new(2017, 01, 03, 11, 00, 00)
t4 = Time.new(2017, 01, 03, 12, 00, 00)

lex = Expedition.create!({
  title: "The future of Medicine",
  description: "Take this tour of medicine's future with some of the trailblazing doctors charting its course. Once you've seen a transplantable human kidney created from a 3D printer, almost anything is imaginable ...",
  theme: "medtech",
  user_id: organiser.id,
  starts_on: Date.new(2017,01,03),
  ends_on: Date.new(2017,02,07),
  location: "San Francisco"
  })

lex2 = Expedition.create!({
  title: "The future of Transportation",
  description: "Take this tour on the future of transportation, cities and AI.",
  user_id: organiser.id,
  starts_on: Date.new(2017,01,03),
  ends_on: Date.new(2017,02,07),
  location: "San Francisco"
  })


d1 = Day.new({
  position: 1,
  date: Date.new(2016,07,02),
  title: "Let's go to SF!"
  })
d1.expedition = lex
d1.save

t0 = Time.new(2016, 07, 02, 19, 30, 00)
t00 = Time.new(2016, 07, 02, 23, 00, 00)

  activity0 = Activity.create({
    title: "Flight to SF",
    category: "Flight",
    description: "Let's meet at the airport and get to SF together.",
    starts_on: t0,
    ends_on: t00,
    day_id: d1.id,
    address: "888 Post Stree, San Francisco, USA"
    })


# DAY 2
#
d2 = Day.new({
  position: 2,
  date: Date.new(2016,07,03),
  title: "Discovery"
  })
d2.expedition = lex
d2.save

t1 = Time.new(2016, 07, 04, 8, 30, 00)
t2 = Time.new(2016, 07, 04, 10, 00, 00)
t3 = Time.new(2016, 07, 04, 10, 30, 00)
t4 = Time.new(2016, 07, 04, 12, 00, 00)
t5 = Time.new(2016, 07, 04, 12, 30, 00)
t6 = Time.new(2016, 07, 04, 13, 45, 00)
t7 = Time.new(2016, 07, 04, 18, 00, 00)
t8 = Time.new(2016, 07, 04, 20, 00, 00)
t9 = Time.new(2016, 07, 04, 23, 00, 00)

  activity1 = Activity.create({
    title: "Welcome Breakfast",
    category: "Meeting",
    description: "Let's share food and perspective on this week",
    starts_on: t1,
    ends_on: t2,
    day_id: d2.id,
    address: "888 Post Stree, San Francisco, USA"
    })

  activity2 = Activity.create({
    title: "Keynote - Predictive medicine.",
    category: "Meeting",
    description: "Health is occupying an ever-larger proportion of the economy. In the United States, health already accounts for 17% of GDP. Aging populations, increased expectations, more advanced—and expensive—treatments, and entrenched health industry structures mean costs will continue to rise. However, it remains possible to create far more effective and efficient systems. Personal health records, pro-active health measures, expertise networks, and robotic assistance are just some of the issues that will drive the future of health. Ross Dawson can lead your audience on an engaging futurist’s journey through where the health industry may go, and what actions today could drive a healthier society tomorrow.",
    starts_on: t3,
    ends_on: t4,
    day_id: d2.id,
    address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
    })

    ressource1 = Ressource.create({
      name: "23andMe",
      category: "Website",
      description: "One of the key players those days",
      url: "www.23andme.com",
      activity_id: activity2.id
      })


  activity3 = Activity.create({
    title: "Transport to lunch",
    category: "Transportation",
    description: "We'll be walking to the restaurant.",
    starts_on: t4,
    ends_on: t5,
    day_id: d2.id,
    address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
    })

  activity4 = Activity.create({
    title: "Reflexion lunch",
    category: "Restaurant",
    description: "What did we learn this morning?",
    starts_on: t5,
    ends_on: t6,
    day_id: d2.id,
    address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
    })

  activity5 = Activity.create({
    title: "Getting inspired - Demo Day",
    category: "Meeting",
    description: "The Medtech+ accelerator will be sharing its companies.",
    starts_on: t6,
    ends_on: t7,
    day_id: d2.id,
    address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
    })


  activity6 = Activity.create({
    title: "Dinner & drinks",
    category: "Restaurant",
    description: "Relaxing time after this 1st intense day",
    starts_on: t8,
    ends_on: t9,
    day_id: d2.id,
    address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
    })

# DAY 3

d3 = Day.new({
  position: 3,
  date: Date.new(2016,07,04),
  title: "Exploration"
  })
d3.expedition = lex
d3.save

d2t1 = Time.new(2016, 07, 04, 8, 30, 00)
d2t2 = Time.new(2016, 07, 04, 10, 00, 00)
d2t3 = Time.new(2016, 07, 04, 10, 30, 00)
d2t4 = Time.new(2016, 07, 04, 12, 00, 00)
d2t5 = Time.new(2016, 07, 04, 12, 30, 00)
d2t6 = Time.new(2016, 07, 04, 13, 45, 00)
d2t7 = Time.new(2016, 07, 04, 18, 00, 00)
d2t8 = Time.new(2016, 07, 04, 20, 00, 00)
d2t9 = Time.new(2016, 07, 04, 23, 00, 00)

  activity1 = Activity.create({
    title: "Breakfast",
    category: "Meeting",
    description: "Let's share food and perspective on the meetings of the day",
    starts_on: d2t1,
    ends_on: d2t2,
    day_id: d3.id,
    address: "888 Post Stree, San Francisco, USA"
    })

  activity2 = Activity.create({
    title: "Keynote - Health in 2025",
    category: "Meeting",
    description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium",
    starts_on: d2t3,
    ends_on: d2t4,
    day_id: d3.id,
    address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
    })

    ressource1 = Ressource.create({
      name: "23andMe",
      category: "Website",
      description: "One of the key players those days",
      url: "www.23andme.com",
      activity_id: activity2.id
      })


  activity3 = Activity.create({
    title: "Transport to lunch",
    category: "Transportation",
    description: "We'll be walking to the restaurant.",
    starts_on: t4,
    ends_on: d2t5,
    day_id: d3.id,
    address: "22, Richard Street, San Francisco, CA 90250, USA"
    })

  activity4 = Activity.create({
    title: "Reflexion lunch",
    category: "Restaurant",
    description: "What did we learn this morning?",
    starts_on: d2t5,
    ends_on: d2t6,
    day_id: d3.id,
    address: "23 downtown street, San Francisco, CA 90250, USA"
    })

  activity5 = Activity.create({
    title: "Getting inspired - Demo Day",
    category: "Meeting",
    description: "The Medtech+ accelerator will be sharing its companies.",
    starts_on: d2t6,
    ends_on: d2t7,
    day_id: d3.id,
    address: "1 Rocket Rd, Hawthorne, CA 90250, USA"
    })


  activity6 = Activity.create({
    title: "Dinner & drinks",
    category: "Restaurant",
    description: "Relaxing time after this 2nd intense day",
    starts_on: d2t8,
    ends_on: d2t9,
    day_id: d3.id,
    address: "23, Post Street, Sand Francisco, USA"
    })

# Other empty days #

d4 = Day.create({
  position: 4,
  date: Date.new(2016,07,05),
  title: "Future of public Health"
  })
d4.expedition = lex
d4.save

d5 = Day.create({
  position: 5,
  date: Date.new(2016,07,06),
  title: "IOT and predictive health"
  })
d5.expedition = lex
d5.save


# --- #

Jeanne = Invitation.create({
    email: "yo1@yoann.co",
    first_name: "Jeanne",
    last_name: "Meeting",
    status: "pending"
  })
lex.invitations << Jeanne
lex.save

Pierre = Invitation.create({
    email: "yo2@yoann.co",
    first_name: "Pierre",
    last_name: "Armand",
    status: nil
  })
lex.invitations << Pierre
lex.save

Peter = Invitation.create({
    email: "yo2@yddoann.co",
    first_name: "Peter",
    last_name: "Jayne",
    status: nil
  })
lex.invitations << Peter
lex.save

Yoann = User.create({
    email: "yo@yoann.co",
    password: "lewagon",
    first_name: "Yoann",
    last_name: "Thomas",
    job: "VP Strategy",
    company: "Le Wagon",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: false
  })

Patricia = User.create({
    email: "yo2+3@yoann.co",
    password: "lewagon",
    first_name: "Patricia",
    last_name: "Toubib (Phd)",
    job: "VP Doctors",
    company: "Hôpitaux Publics de Paris",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: false
  })

William = User.create({
    email: "yo2+d3@yoann.co",
    password: "lewagon",
    first_name: "William",
    last_name: "Patient",
    job: "VP Marketing",
    company: "Hôpitaux Publics de Paris",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: false
  })

Reza = User.create({
    email: "yo2+z3@yoann.co",
    password: "lewagon",
    first_name: "Reza",
    last_name: "Benzema",
    job: "VP New Markets",
    company: "Hôpitaux Publics de Paris",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: false
  })

Timo = User.create({
    email: "yo2+z3@yoann.,nco",
    password: "lewagon",
    first_name: "Timo",
    last_name: "Hector",
    job: "VP Partnerships",
    company: "Hôpitaux Publics de Paris",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: false
  })


Marie = User.create({
    email: "yo2+3s@yoann.co",
    password: "lewagon",
    first_name: "Marie",
    last_name: "Compta",
    job: "DAF",
    company: "Hôpitaux Publics de Paris",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
    phone: "0687335370",
    diet: "no allergies",
    organiser: false
  })


Participation.create(user: Yoann, expedition: lex)
Participation.create(user: Patricia, expedition: lex)
Participation.create(user: Marie, expedition: lex)
Participation.create(user: Reza, expedition: lex)
Participation.create(user: William, expedition: lex)
Participation.create(user: Timo, expedition: lex)


# response = open("https://angel.co/companies")
# doc = Nokogiri::HTML(response, nil, 'utf-8')
# doc.css('.itemName').each do |element|
#   name = element.search('lex').inner_text
#   resource = Resource.create!(name: name)
# end


# Ne marche pas car pas de Faker pour First Name et Last Name

# 10.times do
#   user = User.new({
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#     first_name: Faker::Name.name.split.first,
#     last_name: Faker::Name.name.split.last,
#     job: "Participant",
#     company: Faker::Company.name,
#     bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occ",
#     phone: Faker::PhoneNumber.phone_number,
#     name: Faker::Company.name,
#     organiser: false
#   })
#   user.save
# end


