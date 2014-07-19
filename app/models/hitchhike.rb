class Hitchhike < ActiveRecord::Base
  # phone, hour, comments, taking, from, name 
  
  auto_strip_attributes :name, :nullify => false
  auto_strip_attributes :phone, :nullify => false
  auto_strip_attributes :hour, :nullify => true
  auto_strip_attributes :from, :nullify => false
  auto_strip_attributes :comments, :nullify => true
  
	validates :name, presence: true
	validates :phone, presence: true
	validates :from, presence: true

end
