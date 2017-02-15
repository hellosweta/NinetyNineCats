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


request1 = CatRentalRequest.create(cat_id: cat1.id, start_date: "2016/01/20", end_date: "2017/01/20")
request2 = CatRentalRequest.create(cat_id: cat2.id, start_date: "2016/01/20", end_date: "2016/06/20")
request3 = CatRentalRequest.create(cat_id: cat4.id, start_date: "2015/07/25", end_date: "2015/12/20", status: "APPROVED")

request3.status = "APPROVED"
