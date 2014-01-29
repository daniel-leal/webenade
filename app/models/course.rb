#encoding: utf-8
class Course < ActiveRecord::Base
  attr_accessible :nome

  validates_presence_of :nome, message: "o nome do curso é obrigatório."
  
  has_many :questions


  	def self.search(search)
  		if search
		  	if search.eql?("")
		    	find(:all)
		    else
		    	find(:all, :conditions => ['nome LIKE ?', "%#{search}%"])
		    end
	  	else
			find(:all)
	  	end
	end

end
