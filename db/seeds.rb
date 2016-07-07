# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create! id: 1, name: "Banana", price: 0.49
Product.create! id: 2, name: "Apple", price: 0.29
Product.create! id: 3, name: "Carton of Strawberries", price: 1.99