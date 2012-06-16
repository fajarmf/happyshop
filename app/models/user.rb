class User < ActiveRecord::Base
  attr_accessible :name, :password, :role

  ROLES = ['marketeer', 'vendor', 'customer']

  validates_presence_of :name, :password, :role
  
  validates_inclusion_of :role, :in => ROLES, :message => "must be one of: #{ROLES.join(', ')}"
  
  # human_name :name => "Name", :password => "Password", :role => "Role"  

  def current?
    role != 'marketeer'
  end
end
