require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

