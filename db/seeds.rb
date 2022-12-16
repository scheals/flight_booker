# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  airport_codes = %w[INN LNZ VIE BRU SOF SPU BRQ PRG AAL CPH HEL OUL BVA CDG SXB BER SXF GDN RIX KUN VNO LUX KIV KTW KRK POZ SZZ WAW WMI WRO]
  airport_codes.each { |code| Airport.create(name: code) }
  (1..30).each_with_index do |num, i|
    next Flight.create(origin: Airport.find(num), destination: Airport.find(1), date: (i + 1).day.from_now, duration: ((num + i) / 4) * 10) if num == 30

    Flight.create(origin: Airport.find(num), destination: Airport.find(num + 1), date: (i + 1).day.from_now, duration: (5 + ((num + i) / 2) * 3))
  end
  (1..30).to_a.shuffle.each_with_index do |num, i|
    next Flight.create(origin: Airport.find(num), destination: Airport.find(i), date: (num + 1).day.from_now, duration: (3 + (num + i) / 4) * 4) if num == i + 1

    Flight.create(origin: Airport.find(num), destination: Airport.find(i + 1), date: (num + 1).day.from_now, duration: (3 + ((num + i) / 2) * 3))
  end
