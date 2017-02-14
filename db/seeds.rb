# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cat1 = Cat.create(birth_date: "2015/01/20", name: "Earl", color: "grey", sex: "M")
cat2 = Cat.create(birth_date: "2005/06/18", name: "Oldie", color: "black", sex: "F")
cat3 = Cat.create(birth_date: "2016/12/20", name: "Snowflake", color: "white", sex: "F")
cat4 = Cat.create(birth_date: "1970/03/20", name: "Magic", color: "calico", sex: "M")
