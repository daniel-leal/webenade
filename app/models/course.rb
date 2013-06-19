#encoding: utf-8
class Course < ActiveRecord::Base
  attr_accessible :nome

  validates_presence_of :nome, message: "o nome do curso é obrigatório."
  
  has_many :questions
end
