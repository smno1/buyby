# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
case ENV["TYPE"]
when "admin"
	admin=User.find_by :email =>ENV["ADMIN"]
	admin.add_role :admin
when "status"
	#Status.create(status_type: "offer", name: "accept")
	#Status.create(status_type: "offer", name: "decline")

	#Status.create(status_type: "request", name: "unprocessed")
	#Status.create(status_type: "request", name: "processing")
	#Status.create(status_type: "request", name: "finished")
	Status.create(status_type: "request", name: "closed")
end