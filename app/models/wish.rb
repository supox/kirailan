class Wish < ActiveRecord::Base
  self.per_page = 5
  
  auto_strip_attributes :name, :nullify => false
  auto_strip_attributes :content, :nullify => false
  
	validates :content, length:{minimum:3, maximum:512}
	validates :name, length:{minimum:3, maximum:64}
end
