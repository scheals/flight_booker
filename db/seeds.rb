# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  airport_codes = %w[INN LNZ VIE BRU SOF SPU BRQ PRG AAL CPH HEL OUL BVA CDG SXB BER SXF GDN RIX KUN VNO LUX KIV KTW KRK POZ SZZ WAW WMI WRO]
  airport_codes.each { |code| Airport.create(name: code) }
