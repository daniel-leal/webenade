# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# r1 = Role.new
# r1.nome = "professor"
# r1.save

# r2 = Role.new
# r2.nome = "aluno"
# r2.save

# r3 = Role.new
# r3.nome = "admin"
# r3.save

# u1 = User.new
# u1.email = "admin@gmail.com"
# u1.password = "123456"
# u1.username = "admin"
# u1.nome = "admin"
# u1.roles << r3
# u1.save

# c = Course.new
# c.nome = "Ciência da Computação"
# c.save

# c2 = Course.new
# c2.nome = "Sistema de Informação"
# c2.save

# c3 = Course.new
# c3.nome = "Engenharia da Computação"
# c3.save


q = Question.new
q.alternativa_a = "a1"
q.alternativa_b = "b1"
q.alternativa_c = "c1"
q.alternativa_d = "d1"
q.alternativa_e = "e1"
q.alternativa_correta = "A"
q.assunto = "assunto1"
q.enunciado = "enunciado1"
q.nivel = 1
q.course_id = 2
q.save

q1 = Question.new
q1.alternativa_a = "a2"
q1.alternativa_b = "b2"
q1.alternativa_c = "c2"
q1.alternativa_d = "d2"
q1.alternativa_e = "e2"
q1.alternativa_correta = "B"
q1.assunto = "assunto2"
q1.enunciado = "enunciado2"
q1.nivel = 2
q1.course_id = 3
q1.save

q2 = Question.new
q2.alternativa_a = "a3"
q2.alternativa_b = "b3"
q2.alternativa_c = "c3"
q2.alternativa_d = "d3"
q2.alternativa_e = "e3"
q2.alternativa_correta = "C"
q2.assunto = "assunto3"
q2.enunciado = "enunciado3"
q2.nivel = 3
q2.course_id = 2
q2.save

q3 = Question.new
q3.alternativa_a = "a4"
q3.alternativa_b = "b4"
q3.alternativa_c = "c4"
q3.alternativa_d = "d4"
q3.alternativa_e = "e4"
q3.alternativa_correta = "A"
q3.assunto = "assunto4"
q3.enunciado = "enunciado4"
q3.nivel = 4
q3.course_id = 3
q3.save