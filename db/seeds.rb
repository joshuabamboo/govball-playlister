# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


org = Organizer.create(name: "Founders Entertainment")
fest = Festival.create(name: "Governors Ball", year: 2016, start_date: DateTime.new(2016,6,3), finish_date: DateTime.new(2016,6,5))
fri = FestivalDay.create(start_date: DateTime.new(2016,6,3))
sat = FestivalDay.create(start_date: DateTime.new(2016,6,4))
sun = FestivalDay.create(start_date: DateTime.new(2016,6,5))

org.festivals << fest
org.save
fest.festival_days << fri
fest.festival_days << sat
fest.festival_days << sun
fest.save

fri.artists << Artist.create(name: "THE STROKES")
fri.artists << Artist.create(name: "BECK")
fri.artists << Artist.create(name: "ROBYN")
fri.artists << Artist.create(name: "OF MONSTERS AND MEN")
fri.artists << Artist.create(name: "JAMIE XX")
fri.artists << Artist.create(name: "MATT AND KIM")
fri.artists << Artist.create(name: "BLOC PARTY")
fri.artists << Artist.create(name: "FATHER JOHN MISTY")
fri.artists << Artist.create(name: "ACTION BRONSON")
fri.artists << Artist.create(name: "BIG GRAMS")
fri.artists << Artist.create(name: "DUKE DUMONT")
fri.artists << Artist.create(name: "YEARS & YEARS")
fri.artists << Artist.create(name: "CHRISTINE AND THE QUEENS")
fri.artists << Artist.create(name: "BOB MOSES")
fri.artists << Artist.create(name: "ELLE KING")
fri.artists << Artist.create(name: "BULLY")
fri.artists << Artist.create(name: "MEG MAC")
fri.artists << Artist.create(name: "BOOGIE")
fri.artists << Artist.create(name: "THE LONDON SOULS")
fri.artists << Artist.create(name: "BLACK PISTOL FIRE")
fri.artists << Artist.create(name: "PUBLIC ACCESS T.V.")
fri.artists << Artist.create(name: "TRANSVIOLET")
fri.save


sat.artists << Artist.create(name: "THE KILLERS")
sat.artists << Artist.create(name: "M83")
sat.artists << Artist.create(name: "HAIM")
sat.artists << Artist.create(name: "MIIKE SNOW")
sat.artists << Artist.create(name: "MIGUEL")
sat.artists << Artist.create(name: "PURITY RING")
sat.artists << Artist.create(name: "LORD HURON")
sat.artists << Artist.create(name: "MAC MILLER")
sat.artists << Artist.create(name: "DE LA SOUL")
sat.artists << Artist.create(name: "AGAINST ME!")
sat.artists << Artist.create(name: "CATFISH AND THE BOTTLEMEN")
sat.artists << Artist.create(name: "MISTERWIVES")
sat.artists << Artist.create(name: "ALBERT HAMMOND JR.")
sat.artists << Artist.create(name: "THUNDERCAT")
sat.artists << Artist.create(name: "JON BELLION")
sat.artists << Artist.create(name: "MARIAN HILL")
sat.artists << Artist.create(name: "TORRES")
sat.artists << Artist.create(name: "THE KNOCKS")
sat.artists << Artist.create(name: "LOUIS THE CHILD")
sat.artists << Artist.create(name: "NOTHING")
sat.artists << Artist.create(name: "HOLLY MIRANDA")
sat.artists << Artist.create(name: "ELIOT SUMNER")
sat.save


sun.artists << Artist.create(name: "KANYE WEST")
sun.artists << Artist.create(name: "DEATH CAB FOR CUTIE")
sun.artists << Artist.create(name: "CHVRCHES")
sun.artists << Artist.create(name: "TWO DOOR CINEMA CLUB")
sun.artists << Artist.create(name: "CHET FAKER")
sun.artists << Artist.create(name: "GARY CLARK JR.")
sun.artists << Artist.create(name: "JOEY BADA$$")
sun.artists << Artist.create(name: "COURTNEY BARNETT")
sun.artists << Artist.create(name: "EAGLES OF DEATH METAL")
sun.artists << Artist.create(name: "THOMAS JACK")
sun.artists << Artist.create(name: "COLD WAR KIDS")
sun.artists << Artist.create(name: "VINCE STAPLES")
sun.artists << Artist.create(name: "GALANTIS")
sun.artists << Artist.create(name: "VIC MENSA")
sun.artists << Artist.create(name: "BAT FOR LASHES")
sun.artists << Artist.create(name: "BETTY WHO")
sun.artists << Artist.create(name: "FIDLAR")
sun.artists << Artist.create(name: "CIRCA WAVES")
sun.artists << Artist.create(name: "WHILK & MISKY")
sun.artists << Artist.create(name: "DAY WAVE")
sun.artists << Artist.create(name: "BLANK RANGE")
sun.artists << Artist.create(name: "TOR MILLER")
sun.save
