class Transport < ActiveRecord::Base
  auto_strip_attributes :name, :nullify => false
  auto_strip_attributes :comments, :nullify => false 
	validates :direction, :inclusion => 0..2
  
  def direction_names
    ['הלוך ושוב','רק הלוך','רק חזור']
  end

  def human_direction_name
    direction_names[self.direction]
  end

  after_initialize :default_values

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['שם', 'כיוון', 'טלפון', 'הערות']
      all.each do |t|
        csv << [t.name, t.human_direction_name, t.phone, t.comments]
      end
    end
  end

  private
  def default_values
    self.direction ||= 0
  end


end
