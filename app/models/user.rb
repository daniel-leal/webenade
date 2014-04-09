#encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
           :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :nome, :role_id, :institution
  # attr_accessible :title, :body

  validates_presence_of :username, message: "O campo username é obrigatório."
  validates_presence_of :nome, message: "O campo nome é obrigatório."
  
  validates_uniqueness_of :username, message: "Nome do usuário já existente."


  has_and_belongs_to_many :roles

  def has_role?(r)
    self.roles.each do |rl|
      if rl[:nome]==r
        return true
      end
    end
    return false
  end

end
