class Song < ActiveRecord::Base
  auto_strip_attributes :name, :nullify => false
  auto_strip_attributes :artist, :nullify => false
  validates :name, presence: true, allow_blank: false 
	validates :song_type, :inclusion => 0..2
  
  def song_type_names
    ['ריקודים','קבלת פנים','חופה']
  end

  def human_song_type
    song_type_names[self.song_type]
  end

  after_initialize :default_values

  private
    def default_values
      self.song_type ||= 0
    end

end
