class Role < ActiveRecord::Base
  attr_accessible :nome

  has_one :user
end
