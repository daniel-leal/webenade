# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.new
r1.nome = "professor"
r1.save

r2 = Role.new
r2.nome = "aluno"
r2.save

r3 = Role.new
r3.nome = "admin"
r3.save

u1 = User.new
u1.email = "admin@gmail.com"
u1.password = "123456"
u1.username = "admin"
u1.nome = "admin"
u1.role_id = 3

attr_accessible :email, :password, :password_confirmation, :username, :nome, :role_id

