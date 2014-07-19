class Approval < ActiveRecord::Base
  auto_strip_attributes :name, :nullify => false
  auto_strip_attributes :comments, :nullify => false
  
	validates :guests, numericality: {greater_than:0}
	validates :name, presence: true
end
