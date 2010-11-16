class Song < ActiveRecord::Base
  has_and_belongs_to_many :genres
  validates_uniqueness_of :title
  
  def self.search(search)
    if search
      where( 'title LIKE ? OR artist LIKE ? or album LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" )
    else
      scoped
    end
  end
end

# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  album      :string(255)
#  genre      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  notes      :text
#  found      :boolean         default(FALSE)
#

