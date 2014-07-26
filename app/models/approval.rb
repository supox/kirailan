class Approval < ActiveRecord::Base  
  auto_strip_attributes :name, :nullify => false
  auto_strip_attributes :comments, :nullify => false
  
	validates :guests, numericality: {greater_than:0}
	validates :name, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end


end
